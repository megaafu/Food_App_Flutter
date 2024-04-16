import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/category_provider.dart';
import '../../../constants.dart';
import '../../../bloc/product_provider.dart';

class BackIcon extends StatelessWidget {
  final CategoryBloc categorybloc;
  final ProductBloc productbloc;
  const BackIcon({
    super.key,
    required this.productbloc,
    required this.categorybloc,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: contentpadding,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: background.withOpacity(0.7),
          ),
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: accentcolor,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
