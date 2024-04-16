import 'package:flutter/material.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../constants.dart';
import '../../model/category.dart';
import '../components/home/category_container.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final int index;
  final CategoryBloc categorybloc;
  final ProductBloc productbloc;
  const CategoryItem({
    super.key,
    required this.id,
    required this.index,
    required this.categorybloc,
    required this.productbloc,
  });

  @override
  Widget build(BuildContext context) {
    productbloc.fetchList(0, '');
    categorybloc.setselectedIndex(0);
    return StreamBuilder(
      stream: categorybloc.category,
      builder: (context, AsyncSnapshot<Map<int, Category?>> snapshot) {
        var category = snapshot.data;
        if (category == null) {
          return const CircularProgressIndicator();
        }

        return StreamBuilder(
          stream: categorybloc.selectedIndex,
          builder: (context, AsyncSnapshot<int> snap) {
            var selectedIndex = snap.data;
            if (selectedIndex == null) {
              return const CircularProgressIndicator();
            }
            return Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    int categoryid = category[id]!.id;
                    categorybloc.setselectedIndex(index);
                    productbloc.fetchList(categoryid, '');
                  },
                  child: CategoryContainer(
                    name: category[id]!.name,
                    color:
                        selectedIndex == index ? accentcolor : Colors.grey[200],
                    style: selectedIndex == index ? wsubttitle : subttitle,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
