import 'package:flutter/material.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../model/category.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final CategoryBloc categorybloc;
  final ProductBloc productbloc;
  const CategoryList({
    super.key,
    required this.categorybloc,
    required this.productbloc,
  });

  @override
  Widget build(BuildContext context) {
    final categorybloc = CategoryProvider.of(context);
    categorybloc.fetchCategories();
    return StreamBuilder(
      stream: categorybloc.categoryList,
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        var produts = snapshot.data;
        if (produts == null) {
          return const CircularProgressIndicator();
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: produts.length,
                (context, index) {
                  int id = produts[index].id;
                  categorybloc.fetchCategory(id);
                  return CategoryItem(
                    productbloc: productbloc,
                    categorybloc: categorybloc,
                    index: index,
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
