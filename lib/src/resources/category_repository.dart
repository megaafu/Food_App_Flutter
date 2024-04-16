import '../model/category.dart';

class CategoryRepository {
  final List<Category> _categories = [
    Category(id: 0, name: 'Todos'),
    Category(id: 1, name: 'Hamburger'),
    Category(id: 2, name: 'Sobremesa'),
    Category(id: 3, name: 'Refeicao'),
  ];
  List<Category> fetchCategories() {
    return _categories;
  }

  Category? fetchCategory(id) {
    Category? product;
    for (int i = 0; i < _categories.length; i++) {
      if (_categories[i].id == id) product = _categories[i];
    }
    return product;
  }
}
