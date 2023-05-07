import 'dart:core';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class GetUserMediaPage extends StatefulWidget {
  const GetUserMediaPage({super.key});

  @override
  State<GetUserMediaPage> createState() => _GetUserMediaPageState();
}

class _GetUserMediaPageState extends State<GetUserMediaPage> {
  late MediaStream _localStream;
  final _localRenderer = RTCVideoRenderer();
  bool _isOpen = false;

  _initRenderers() async {
    await _localRenderer.initialize();
  }

  _open() async {
    // https://developer.mozilla.org/zh-CN/docs/Web/API/MediaDevices/getUserMedia
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

  @override
  void initState() {
    super.initState();
    _initRenderers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get User Media'),
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
        child: Icon(_isOpen ? Icons.close : Icons.videocam),
      ),
    );
  }
}
