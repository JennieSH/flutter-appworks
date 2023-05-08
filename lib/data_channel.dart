import 'dart:core';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class DataChannelPage extends StatefulWidget {
  const DataChannelPage({super.key});

  @override
  State<DataChannelPage> createState() => _DataChannelPageState();
}

class _DataChannelPageState extends State<DataChannelPage> {
  String _message = "";
  RTCPeerConnection? _localConnection;
  RTCPeerConnection? _remoteConnection;
  RTCDataChannelInit? _dataChannelDict = null;
  late RTCDataChannel _sendChannel;
  late RTCDataChannel _receiveChannel;
  bool _isConnected = false;

  final Map<String, dynamic> _sdp_Constraints = {
    'mandatory': {
      'OfferToReceiveAudio': false, // 是否接受 Audio
      'OfferToReceiveVideo': false, // 是否接受 Video
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

  _sendMessage() {
    _sendChannel.send(RTCDataChannelMessage('hello world'));
  }

  _onReceiveMessageCallback(RTCDataChannelMessage message) {
    setState(() {
      _message = message.text;
    });
  }

  _onReceiveStateCallback(RTCDataChannelState state) {
    print(state);
  }

  _onDataChannel(RTCDataChannel dataChannel) {
    _receiveChannel = dataChannel;
    _receiveChannel.onMessage = _onReceiveMessageCallback;
    _receiveChannel.onDataChannelState = _onReceiveStateCallback;
  }

  _open() async {
    if (_localConnection != null || _remoteConnection != null) return;

    try {
      // local

      _localConnection =
          await createPeerConnection(_iceServersConfiguration, _pc_Constraints);
      _localConnection!.onIceCandidate = _onLocalCandidate;
      _localConnection!.onIceConnectionState = _onLocalIceConnectionState;

      // 建立發送通道
      _dataChannelDict = RTCDataChannelInit();
      // channel unique id
      _dataChannelDict!.id = 1;
      // channel 發送訊息，是否需要與到達順序一致
      _dataChannelDict!.ordered = true;
      // 最大重傳時間，-1 為資料不會被重傳
      _dataChannelDict!.maxRetransmitTime = -1;
      // 最大重傳次數，-1 不會有任何限制在重新傳送資料的次數上
      _dataChannelDict!.maxRetransmits = -1;
      _dataChannelDict!.protocol = "sctp";
      // false，這代表此資料通道是雙方都同意創建的，而不是由其中一方發起
      _dataChannelDict!.negotiated = false;
      _sendChannel = await _localConnection!
          .createDataChannel('dataChannel', _dataChannelDict!);

      // remote
      _remoteConnection =
          await createPeerConnection(_iceServersConfiguration, _pc_Constraints);
      _remoteConnection!.onIceCandidate = _onRemoteCandidate;
      _remoteConnection!.onIceConnectionState = _onRemoteIceConnectionState;
      _remoteConnection!.onDataChannel = _onDataChannel;

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
      await _localConnection?.close();
      _localConnection = null;

      await _remoteConnection?.close();
      _remoteConnection = null;
    } catch (e) {
      print(e.hashCode);
    }

    setState(() {
      _isConnected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'form caller： $_message',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: _isConnected ? _sendMessage : null,
              child: Text(_isConnected ? 'Send' : 'Please connect first'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isConnected ? _close : _open,
        child: Icon(_isConnected ? Icons.close : Icons.cable),
      ),
    );
  }
}
