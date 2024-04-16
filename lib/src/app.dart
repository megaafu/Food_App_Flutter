import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'bloc/category_provider.dart';
import 'bloc/product_provider.dart';
import 'screens/pages/home.dart';
import 'screens/pages/product_detail.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return CategoryProvider(
          child: ProductProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.orange.withOpacity(0.4),
                ),
              ),
              title: 'Restraunt',
              initialRoute: '/',
              onGenerateRoute: routes,
            ),
          ),
        );
      },
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return const Home();
        },
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          final categoryBloc = CategoryProvider.of(context);
          final productBloc = ProductProvider.of(context);
          final id = int.parse(
            settings.name!.replaceFirst('/', ''),
          );
          return ProductDetail(
            id: id,
            productbloc: productBloc,
            categorybloc: categoryBloc,
          );
        },
      );
    }
  }
}
