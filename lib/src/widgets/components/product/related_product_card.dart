import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

class RelatedProductCard extends StatelessWidget {
  final String img;
  final String name;
  final double price;
  final int duration;
  const RelatedProductCard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: contentpadding,
      height: 35.h,
      width:40.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 17.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 5,
                  ),
                  Text(
                    '$duration min',
                    style: asubttitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                '$price MZN',
                style: heading2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
