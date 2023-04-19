import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:flutter_appworks/pages/home.dart';
import 'package:flutter_appworks/pages/not_found.dart';
import 'package:flutter_appworks/pages/product.dart';
import 'package:flutter_appworks/pages/shopping_cart.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteName.home,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomePage(),
          );
        },
      ),
      GoRoute(
        name: RouteName.product,
        path: '/product/:id',
        pageBuilder: (context, state) {
          final id = state.params['id']!;
          return MaterialPage(
            child: ProductPage(id: id),
          );
        },
      ),
      GoRoute(
        name: RouteName.cart,
        path: '/cart',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ShoppingCartPage(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: NotFound(),
      );
    },
  );
}
