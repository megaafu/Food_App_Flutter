import '../model/product.dart';

class ProductRepository {
  final List<Product> _products = const [
    Product(
      id: 1111,
      name: 'Cheeseburger',
      price: 150,
      img: 'images/burger1.jpg',
      category: 1,
      duraction: 10,
      description: 'Pao, Hamburger, Queijo, cebolas',
    ),
    Product(
      id: 1112,
      name: 'Hamburger',
      price: 100,
      img: 'images/burger2.jpg',
      category: 1,
      duraction: 10,
      description: 'Pao, Hamburger, Alface, cebolas',
    ),
    Product(
      id: 1113,
      name: 'Burger Picanha',
      price: 200,
      img: 'images/burger3.jpg',
      category: 1,
      duraction: 15,
      description: 'Pao, Hamburger, Tomate, Pepino, Repolho',
    ),
    Product(
      id: 1114,
      name: 'Salada de Fruta',
      price: 350,
      img: 'images/diserve1.jpg',
      category: 2,
      duraction: 20,
      description: 'Papaia, Manga, Morango, Kiwi,Iogurte',
    ),
    Product(
      id: 1115,
      name: 'IceCream Sandwich',
      price: 300,
      img: 'images/diserve2.png',
      category: 2,
      duraction: 30,
      description: 'Pudim, Bolo, Gelado',
    ),
    Product(
      id: 1116,
      name: 'Bolo doce',
      price: 400,
      img: 'images/diserve3.jpeg',
      category: 2,
      duraction: 40,
      description:
          'Gomas, Farinha, Ovos, Iogurte,Leite,Acucar,Margarina,Fermento',
    ),
    Product(
      id: 1117,
      name: 'Peixe Grelado',
      price: 600,
      img: 'images/food1.jpg',
      category: 3,
      duraction: 45,
      description: 'Peixe Vermelho, Cebolinha, Ananas',
    ),
    Product(
      id: 1118,
      name: 'Arroz de Vegetais',
      price: 450,
      img: 'images/food2.jpeg',
      category: 3,
      duraction: 45,
      description: 'Arroz, Rolos de Frango, Cebolinha, Cenoura',
    ),
    Product(
      id: 1119,
      name: 'Floresta de Carne',
      price: 700,
      img: 'images/food3.jpeg',
      category: 3,
      duraction: 35,
      description: 'Arroz, Carne, Tomate, Cebola,Iogurte,Folha de louro',
    ),
  ];

  List<Product> fetchProducts(int id, String key) {
    List<Product> products = [];
    for (int i = 0; i < _products.length; i++) {
      if (key != '') {
        if (_products[i].category == id) {
          if (_products[i].name.toLowerCase().contains(key.toLowerCase())) {
            products.add(_products[i]);
          }
        } else if (id == 0) {
          if (_products[i].name.toLowerCase().contains(key.toLowerCase())) {
            products.add(_products[i]);
          }
        }
      } else {
        if (_products[i].category == id) {
          products.add(_products[i]);
        } else if (id == 0) {
          products.add(_products[i]);
        }
      }
    }
    return products;
  }

  List<Product> fetchRelatedProducts(int productid, int categoryid) {
    List<Product> relatedproducts = [];
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].category == categoryid && _products[i].id != productid) {
        relatedproducts.add(_products[i]);
      }
    }
    return relatedproducts;
  }

  Product? fetchProduct(
    int id,
  ) {
    Product? product;
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == id) {
        product = _products[i];
      }
    }
    return product;
  }
}
