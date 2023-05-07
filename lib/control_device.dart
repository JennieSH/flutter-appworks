import 'dart:core';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class ControlDevicePage extends StatefulWidget {
  const ControlDevicePage({super.key});

  @override
  State<ControlDevicePage> createState() => _ControlDevicePageState();
}

class _ControlDevicePageState extends State<ControlDevicePage> {
  late MediaStream _localStream;
  final _localRenderer = RTCVideoRenderer();
  bool _isOpen = false;
  bool _isCameraOff = false;
  bool _isMicrophoneOff = false;
  bool _isSpeakerOn = true;

  _initRenderers() async {
    await _localRenderer.initialize();
  }

  _open() async {
    final Map<String, dynamic> mediaConstraints = {
      "audio": true,
      "video": {
        "width": 1280,
        "height": 720,
      }
    };

    try {
      MediaStream stream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      _localStream = stream;
      _localRenderer.srcObject = _localStream;
    } catch (e) {
      print(e.toString());
    }

    if (!mounted) return;
    setState(() {
      _isOpen = true;
    });
  }

  _close() async {
    try {
      await _localStream.dispose();
      _localRenderer.srcObject = null;
    } catch (e) {
      print(e.hashCode);
    }

    setState(() {
      _isOpen = false;
    });
  }

  _switchCamera() {
    if (_localStream != null && _localStream.getVideoTracks().length > 0) {
      Helper.switchCamera(_localStream.getVideoTracks()[0]);
    } else {
      print('cannot switch camera');
    }
  }

  _turnCameraState() {
    if (_localStream != null && _localStream.getVideoTracks().length > 0) {
      var muted = !_isCameraOff;
      setState(() {
        _isCameraOff = muted;
      });
      _localStream.getVideoTracks()[0].enabled = !muted;
    } else {
      print('cannot mute camera');
    }
  }

  _turnMicrophoneState() {
    if (_localStream != null && _localStream.getVideoTracks().length > 0) {
      var muted = !_isMicrophoneOff;
      setState(() {
        _isMicrophoneOff = muted;
      });
      _localStream.getAudioTracks()[0].enabled = !muted;

      print(muted ? '已靜音' : '取消靜音');
    } else {
      print('microphone got something wrong');
    }
  }

  _switchSpeaker() {
    setState(() {
      _isSpeakerOn = !_isSpeakerOn;
      MediaStreamTrack audioTrack = _localStream.getAudioTracks()[0];
      audioTrack.enableSpeakerphone(_isSpeakerOn);
      print("目前音源：" + (_isSpeakerOn ? '擴音' : '手機'));
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
        title: const Text('Control Device'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: RTCVideoView(_localRenderer),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isOpen ? _close : _open,
        child: Icon(_isOpen ? Icons.close : Icons.phone),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: _switchCamera,
              icon: const Icon(Icons.switch_camera),
            ),
            IconButton(
              onPressed: _turnCameraState,
              icon: Icon(_isCameraOff ? Icons.videocam_off : Icons.videocam),
            ),
            IconButton(
              onPressed: _turnMicrophoneState,
              icon: Icon(_isMicrophoneOff ? Icons.mic_off : Icons.mic),
            ),
            IconButton(
              onPressed: _switchSpeaker,
              icon: Icon(_isSpeakerOn ? Icons.volume_up : Icons.phone_android),
            )
          ],
        ),
      ),
    );
  }
}
