import 'package:flutter/material.dart';

import 'category_bloc.dart';
export 'category_bloc.dart';

class CategoryProvider extends InheritedWidget {
  final CategoryBloc bloc;
  CategoryProvider({Key? key, required Widget child})
      : bloc = CategoryBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;
  static CategoryBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CategoryProvider>()
            as CategoryProvider)
        .bloc;
  }
}
