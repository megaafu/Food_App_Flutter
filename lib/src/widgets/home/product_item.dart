import 'package:flutter/material.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../model/product.dart';
import '../components/home/product_card.dart';

class ProductItem extends StatelessWidget {
  final ProductBloc productbloc;
  final CategoryBloc categorybloc;
  final int id;
  const ProductItem({
    super.key,
    required this.productbloc,
    required this.id,
    required this.categorybloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productbloc.products,
      builder: (context, AsyncSnapshot<Map<int, Product?>> snapshot) {
        var product = snapshot.data;
        if (product == null) {
          return const CircularProgressIndicator();
        }

        return Column(
          children: [
            Hero(
              tag: id,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/$id');
                  },
                  child: ProductCard(
                    id: id,
                    duration: product[id]!.duraction,
                    price: product[id]!.price,
                    img: product[id]!.img,
                    name: product[id]!.name,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            )
          ],
        );
      },
    );
  }
}
