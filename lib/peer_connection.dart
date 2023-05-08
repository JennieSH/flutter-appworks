import 'dart:core';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class PeerConnectionPage extends StatefulWidget {
  const PeerConnectionPage({super.key});

  @override
  State<PeerConnectionPage> createState() => _PeerConnectionPageState();
}

class _PeerConnectionPageState extends State<PeerConnectionPage> {
  late MediaStream _localStream;
  late MediaStream _remoteStream;
  RTCPeerConnection? _localConnection;
  RTCPeerConnection? _remoteConnection;
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  bool _isConnected = false;

  final Map<String, dynamic> _mediaConstraints = {
    "audio": true,
    "video": {
      'mandatory': {
        'minWidth': '640', // Provide your own width, height and frame rate here
        'minHeight': '480',
        'minFrameRate': '30',
      },
      'facingMode': 'user',
      'optional': [],
    }
  };

  final Map<String, dynamic> _sdp_Constraints = {
    'mandatory': {
      'OfferToReceiveAudio': true, // 是否接受 Audio
      'OfferToReceiveVideo': true, // 是否接受 Video
    },
    'optional': [],
  };

  final Map<String, dynamic> _pc_Constraints = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true}, // 是否與瀏覽器互通
    ]
  };

  final Map<String, dynamic> _iceServersConfiguration = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
      /*
       * turn server configuration example.
      {
        'url': 'turn:123.45.67.89:3478',
        'username': 'change_to_real_user',
        'credential': 'change_to_real_secret'
      },
      */
    ]
  };

  _onLocalCandidate(RTCIceCandidate candidate) {
    // 發送給遠端連接
    _remoteConnection?.addCandidate(candidate);
    print('localCandidate: ${candidate.candidate}');
  }

  _onLocalIceConnectionState(RTCIceConnectionState state) {
    print(state);
  }

  _onRemoteCandidate(RTCIceCandidate candidate) {
    _localConnection?.addCandidate(candidate);
    print('remoteCandidate: ${candidate.candidate}');
  }

  _onRemoteIceConnectionState(RTCIceConnectionState state) {
    print(state);
  }

  _onRemoteAddStream(MediaStream stream) {
    _remoteStream = stream;
    _remoteRenderer.srcObject = _remoteStream;
  }

  _initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  _open() async {
    if (_localConnection != null || _remoteConnection != null) return;

    try {
      // local
      _localStream =
          await navigator.mediaDevices.getUserMedia(_mediaConstraints);
      _localRenderer.srcObject = _localStream;

      _localConnection =
          await createPeerConnection(_iceServersConfiguration, _pc_Constraints);
      _localConnection!.onIceCandidate = _onLocalCandidate;
      _localConnection!.onIceConnectionState = _onLocalIceConnectionState;

      _localConnection!.addStream(_localStream);
      Helper.setMicrophoneMute(false, _localStream.getAudioTracks()[0]);

      // remote
      _remoteConnection =
          await createPeerConnection(_iceServersConfiguration, _pc_Constraints);
      _remoteConnection!.onIceCandidate = _onRemoteCandidate;
      // 遠端 stream callback
      _remoteConnection!.onAddStream = _onRemoteAddStream;
      _remoteConnection!.onIceConnectionState = _onRemoteIceConnectionState;

      // 交換 sdp 訊息
      RTCSessionDescription offer =
          await _localConnection!.createOffer(_sdp_Constraints);
      print('offer: ${offer.sdp}');
      _localConnection!.setLocalDescription(offer);
      _remoteConnection!.setRemoteDescription(offer);

      RTCSessionDescription answer =
          await _remoteConnection!.createAnswer(_sdp_Constraints);
      print('answer: ${answer.sdp}');
      _remoteConnection!.setLocalDescription(answer);
      _localConnection!.setRemoteDescription(answer);
    } catch (e) {
      print(e.toString());
    }

    if (!mounted) return;
    setState(() {
      _isConnected = true;
    });
  }

  _close() async {
    try {
      await _localStream.dispose();
      await _localConnection?.close();
      _localRenderer.srcObject = null;
      _localConnection = null;

      await _remoteStream.dispose();
      await _remoteConnection?.close();
      _remoteRenderer.srcObject = null;
      _remoteConnection = null;
    } catch (e) {
      print(e.hashCode);
    }

    setState(() {
      _isConnected = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initRenderers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peer Connection'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
              child: orientation == Orientation.landscape
                  ? Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: RTCVideoView(_localRenderer, mirror: true),
                          ),
                        ),
                        const SizedBox(width: 36),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: RTCVideoView(_remoteRenderer),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: RTCVideoView(_localRenderer, mirror: true),
                          ),
                        ),
                        const SizedBox(height: 36),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: RTCVideoView(_remoteRenderer),
                          ),
                        )
                      ],
                    ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isConnected ? _close : _open,
        child: Icon(_isConnected ? Icons.close : Icons.videocam),
      ),
    );
  }
}
