import 'package:flutter/material.dart';

import '../bloc/category_provider.dart';
import '../bloc/product_provider.dart';
import 'pages/home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryProvider(
        child: ProductProvider(
          child: const Home(),
        ),
      ),
    );
  }
}
