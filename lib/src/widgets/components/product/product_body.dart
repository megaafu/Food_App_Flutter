import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sizer/sizer.dart';

import '../../../bloc/category_provider.dart';
import '../../../bloc/product_provider.dart';
import '../../../constants.dart';
import '../../../model/product.dart';

class ProductBody extends StatelessWidget {
  final ProductBloc productbloc;
  final int id;
  final CategoryBloc categorybloc;
  const ProductBody({
    super.key,
    required this.id,
    required this.productbloc,
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
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: bodypadding,
              decoration: const BoxDecoration(
                color: background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: 60.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product[id]!.name,
                        style: heading1,
                      ),
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.clock,
                            size: 12.sp,
                            color: accentcolor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${product[id]!.duraction} min',
                            style: asubttitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Descricao',
                    style: title,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product[id]!.description,
                    style: subttitle,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
