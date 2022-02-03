import 'package:dart_week/app/product_detail/product_detail_bindings.dart';
import 'package:dart_week/app/product_detail/product_detail_page.dart';
import 'package:get/get.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
        name: '/product_detail',
        binding: ProductDetailBindings(),
        page: () => const ProductDetailPage()),
  ];
}
