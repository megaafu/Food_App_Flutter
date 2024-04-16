import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProcutImage extends StatelessWidget {
  final String img;
  const ProcutImage({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
