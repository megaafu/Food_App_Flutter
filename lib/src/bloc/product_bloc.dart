import '../model/product.dart';
import '../resources/product_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final _products = ProductRepository();
  final _procutlist = BehaviorSubject<List<Product>>();
  final _productOutput = BehaviorSubject<Map<int, Product?>>();
  final _productFetcher = PublishSubject<int>();

  Stream<List<Product>> get productList => _procutlist.stream;
  Stream<Map<int, Product?>> get products => _productOutput.stream;

  Function(int) get fetchProcut => _productFetcher.sink.add;

  ProductBloc() {
    _productFetcher.stream
        .transform(_productTransformer())
        .pipe(_productOutput);
  }
  fetchList(id, key) {
    final product = _products.fetchProducts(id, key);
    _procutlist.sink.add(product);
  }

  fetchRelatedList(productid, categoryid) {
    final product = _products.fetchRelatedProducts(productid, categoryid);
    _procutlist.sink.add(product);
  }

  _productTransformer() {
    return ScanStreamTransformer(
      (Map<int, Product?> cache, int id, index) {
        cache[id] = _products.fetchProduct(id);
        return cache;
      },
      <int, Product?>{},
    );
  }

  dispose() {
    _procutlist.close();
    _productOutput.close();
    _productFetcher.close();
  }
}
