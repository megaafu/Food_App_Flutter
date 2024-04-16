import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/product_provider.dart';
import '../../../constants.dart';
import '../../../model/product.dart';

class FloactingButton extends StatelessWidget {
  final ProductBloc productbloc;
  final int id;
  const FloactingButton({
    super.key,
    required this.id,
    required this.productbloc,
  });

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return StreamBuilder(
        stream: productbloc.products,
        builder: (context, AsyncSnapshot<Map<int, Product?>> snapshot) {
          var product = snapshot.data;
          if (product == null) {
            return const CircularProgressIndicator();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SizedBox(
                  width: 18.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.minus,
                        size: 12.sp,
                        color: lightblack,
                      ),
                      Text(
                        '$i',
                        style: title,
                      ),
                      GestureDetector(
                        onTap: () => i++,
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          size: 12.sp,
                          color: lightblack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 25,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  backgroundColor: accentcolor,
                  shadowColor: accentcolor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  '${i * product[id]!.price} MZN | Adicionar',
                  style: wsubttitle,
                ),
              ),
            ],
          );
        });
  }
}
