import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/category_provider.dart';
import '../../bloc/product_provider.dart';
import '../../constants.dart';

class Search extends StatelessWidget {
  final ProductBloc productbloc;
  final CategoryBloc categorybloc;
  const Search({
    super.key,
    required this.productbloc,
    required this.categorybloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: categorybloc.selectedIndex,
      builder: (context, snapshot) {
        var selectedIndex = snapshot.data;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextField(
            style: subttitle,
            cursorColor: accentcolor,
            onChanged: (String key) {
              productbloc.fetchList(selectedIndex, key);
            },
            decoration: InputDecoration(
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 14.sp,
                color: accentcolor,
              ),
              border: InputBorder.none,
            ),
          ),
        );
      },
    );
  }
}
