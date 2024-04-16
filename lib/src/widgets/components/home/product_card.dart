import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String img;
  final String name;
  final double price;
  final int duration;
  const ProductCard({
    super.key,
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: accentcolor.withOpacity(0.85),
      elevation: 2,
      color: background.withOpacity(0.75),
      child: Container(
        padding: contentpadding,
        height: 15.h,
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: title,
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.clock,
                      size: 12.sp,
                      color: accentcolor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$duration min',
                      style: asubttitle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$price MZN',
                  style: heading2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
