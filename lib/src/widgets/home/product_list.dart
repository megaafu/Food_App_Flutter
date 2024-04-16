import 'package:flutter/material.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../model/product.dart';
import 'product_item.dart';

class ProductList extends StatelessWidget {
  final CategoryBloc categorybloc;
  final ProductBloc productbloc;
  const ProductList({
    super.key,
    required this.productbloc,
    required this.categorybloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productbloc.productList,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        var produts = snapshot.data;
        if (produts == null) {
          return const CircularProgressIndicator();
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: produts.length,
                (context, index) {
                  int id = produts[index].id;
                  productbloc.fetchProcut(id);
                  return ProductItem(
                    categorybloc: categorybloc,
                    productbloc: productbloc,
                    id: id,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
