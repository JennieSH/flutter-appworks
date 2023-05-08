import 'package:flutter/material.dart';
import 'package:flutter_appworks/control_device.dart';
import 'package:flutter_appworks/data_channel.dart';
import 'package:flutter_appworks/get_display_media.dart';
import 'package:flutter_appworks/get_user_media.dart';
import 'package:flutter_appworks/peer_connection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webrtc'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Get User Media'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GetUserMediaPage(),
              ),
            ),
          ),
          // 目前 android 不能使用，會關閉 APP
          ListTile(
            title: const Text('Screen Capture'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GetDisplayMediaPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Control Device'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ControlDevicePage(),
              ),
            ),
          ),
          // 目前 android 不能使用，會關閉 APP
          ListTile(
            title: const Text('Peer Connection'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PeerConnectionPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Data Channel'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DataChannelPage(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
