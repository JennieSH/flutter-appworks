import 'dart:core';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class GetDisplayMediaPage extends StatefulWidget {
  const GetDisplayMediaPage({super.key});

  @override
  State<GetDisplayMediaPage> createState() => _GetDisplayMediaPageState();
}

class _GetDisplayMediaPageState extends State<GetDisplayMediaPage> {
  late MediaStream _localStream;
  final _localRenderer = RTCVideoRenderer();
  bool _isOpen = false;

  _initRenderers() async {
    await _localRenderer.initialize();
  }

  _open() async {
    final Map<String, dynamic> mediaConstraints = {
      "audio": false,
      "video": true
    };

    try {
      MediaStream stream =
          await navigator.mediaDevices.getDisplayMedia(mediaConstraints);
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
        title: const Text('Screen Capture'),
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
