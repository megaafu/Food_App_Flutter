import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../model/product.dart';
import '../../widgets/components/product/back_icon.dart';
import '../../widgets/components/product/cart_icon.dart';
import '../../widgets/components/product/floating_button.dart';
import '../../widgets/components/product/product_body.dart';
import '../../widgets/components/product/product_image.dart';

class ProductDetail extends StatelessWidget {
  final CategoryBloc categorybloc;
  final ProductBloc productbloc;
  final int id;
  const ProductDetail({
    super.key,
    required this.id,
    required this.productbloc,
    required this.categorybloc,
  });

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return StreamBuilder(
      stream: productbloc.products,
      builder: (context, AsyncSnapshot<Map<int, Product?>> snapshot) {
        var product = snapshot.data;
        if (product == null) {
          return const CircularProgressIndicator();
        }
        return Hero(
          tag: id,
          child: Scaffold(
            floatingActionButton: FloactingButton(
              id: id,
              productbloc: productbloc,
            ),
            body: Stack(
              children: [
                ProcutImage(
                  img: product[id]!.img,
                ),
                BackIcon(
                  categorybloc: categorybloc,
                  productbloc: productbloc,
                ),
                const CartIcon(),
                ProductBody(
                  categorybloc: categorybloc,
                  id: id,
                  productbloc: productbloc,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
