import 'package:flutter/material.dart';
import 'package:flutter_appworks/services/key_vision.dart';
import 'package:flutter_appworks/services/product.dart';
import 'package:flutter_appworks/widgets/home/home_desktop_layout.dart';
import 'package:flutter_appworks/widgets/home/home_mobile_layout.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [women, men, accessories];
    final kvList = getKeyVisionList();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            width: 120.0,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
      body: ResponsiveLayout(
        mobileBody: HomeMobileLayout(kvList: kvList, categories: categories),
        desktopBody: HomeDesktopLayout(kvList: kvList, categories: categories),
      ),
    );
  }
}
