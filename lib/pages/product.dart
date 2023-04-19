import 'package:flutter/material.dart';
import 'package:flutter_appworks/blocs/product/product_bloc.dart';
import 'package:flutter_appworks/constants/route.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_appworks/widgets/errorText.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/product/product_desktop_layout.dart';
import 'package:flutter_appworks/widgets/product/product_mobile_layout.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  final String id;

  const ProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) =>
              ProductBloc()..add(GetProductEvent(int.parse(id))),
        ),
        BlocProvider<ProductSelectorCubit>(
          create: (BuildContext context) => ProductSelectorCubit(),
        ),
      ],
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
          body: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) => {
              if (state is ProductSuccessState)
                context.read<ProductSelectorCubit>().initProduct(state.product)
            },
            builder: (context, state) {
              if (state is ProductErrorState) {
                return ErrorText(state.message.toString());
              } else if (state is ProductSuccessState) {
                return ResponsiveLayout(
                  mobileBody: ProductMobileLayout(product: state.product),
                  desktopBody: ProductDesktopLayout(product: state.product),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
