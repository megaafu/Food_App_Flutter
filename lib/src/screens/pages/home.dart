import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../constants.dart';
import '../../widgets/home/appbar.dart';
import '../../widgets/home/category_list.dart';
import '../../widgets/home/product_list.dart';
import '../../widgets/home/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productbloc = ProductProvider.of(context);
    final categorybloc = CategoryProvider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            100.w,
            20.h,
          ),
          child: const MyAppBar(),
        ),
        body: Padding(
          padding: contentpadding,
          child: Column(
            children: [
              Search(
                productbloc: productbloc,
                categorybloc: categorybloc,
              ),
              Expanded(
                child: CategoryList(
                  categorybloc: categorybloc,
                  productbloc: productbloc,
                ),
              ),
              Expanded(
                flex: 9,
                child: ProductList(
                  categorybloc: categorybloc,
                  productbloc: productbloc,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
