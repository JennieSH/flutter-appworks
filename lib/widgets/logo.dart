import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:go_router/go_router.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.replaceNamed(RouteName.home),
      child: SizedBox(
        width: 120.0,
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }
}
