import 'package:flutter/material.dart';

import 'product_bloc.dart';
export 'product_bloc.dart';

class ProductProvider extends InheritedWidget {
  final ProductBloc bloc;
  ProductProvider({Key? key, required Widget child})
      : bloc = ProductBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;
  static ProductBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProductProvider>()
            as ProductProvider)
        .bloc;
  }
}