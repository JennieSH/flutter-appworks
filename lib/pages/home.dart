import 'package:flutter/material.dart';
import 'package:flutter_appworks/blocs/product_list/product_list_bloc.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/errorText.dart';
import 'package:flutter_appworks/widgets/home/home_desktop_layout.dart';
import 'package:flutter_appworks/widgets/home/home_mobile_layout.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc()..add(GetProductListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Logo(),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  context.pushNamed(RouteName.cart);
                },
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListErrorState) {
              return ErrorText(state.message.toString());
            } else if (state is ProductListSuccessState) {
              final categories = [
                Category(name: '女裝', products: state.women),
                Category(name: '男裝', products: state.men),
                Category(name: '配件', products: state.accessories)
              ];

              return ResponsiveLayout(
                mobileBody: HomeMobileLayout(
                    campaigns: state.campaigns, categories: categories),
                desktopBody: HomeDesktopLayout(
                    campaigns: state.campaigns, categories: categories),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
