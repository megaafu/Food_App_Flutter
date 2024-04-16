import '../model/category.dart';

import 'package:rxdart/rxdart.dart';

import '../resources/category_repository.dart';

class CategoryBloc {
  final _categories = CategoryRepository();
  final _categorylist = BehaviorSubject<List<Category>>();
  final _categoryOutput = BehaviorSubject<Map<int, Category?>>();
  final _categoryFetcher = PublishSubject<int>();
  final _selectedIndex = BehaviorSubject<int>();

  Stream<List<Category>> get categoryList => _categorylist.stream;
  Stream<Map<int, Category?>> get category => _categoryOutput.stream;
  Stream<int> get selectedIndex => _selectedIndex.stream;

  Function(int) get fetchCategory => _categoryFetcher.sink.add;
  Function(int) get setselectedIndex => _selectedIndex.sink.add;

  CategoryBloc() {
    _categoryFetcher.stream
        .transform(_productTransformer())
        .pipe(_categoryOutput);
  }
  fetchCategories() {
    final categories = _categories.fetchCategories();
    _categorylist.sink.add(categories);
  }

  _productTransformer() {
    return ScanStreamTransformer(
      (Map<int, Category?> cache, int id, index) {
        cache[id] = _categories.fetchCategory(id);
        return cache;
      },
      <int, Category?>{},
    );
  }

  dispose() {
    _categorylist.close();
    _categoryOutput.close();
    _categoryFetcher.close();
  }
}
