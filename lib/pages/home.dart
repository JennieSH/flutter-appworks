import 'package:flutter/material.dart';
import 'package:flutter_appworks/blocs/product_list/product_list_bloc.dart';
import 'package:flutter_appworks/models/product.dart';

import 'package:flutter_appworks/services/key_vision.dart';
import 'package:flutter_appworks/widgets/home/home_desktop_layout.dart';
import 'package:flutter_appworks/widgets/home/home_mobile_layout.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final kvList = getKeyVisionList();

    return BlocProvider(
      create: (context) => ProductListBloc()..add(GetProductListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Logo(),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListLoadingState) {
              return const Text('loading');
            } else if (state is ProductListSuccessState) {
              final categories = [
                Category(name: '女裝', products: state.women),
                Category(name: '男裝', products: state.men),
                Category(name: '配件', products: state.accessories)
              ];

              return ResponsiveLayout(
                mobileBody:
                    HomeMobileLayout(kvList: kvList, categories: categories),
                desktopBody:
                    HomeDesktopLayout(kvList: kvList, categories: categories),
              );
            } else {
              return const Text('error');
            }
          },
        ),
      ),
    );
  }
}
