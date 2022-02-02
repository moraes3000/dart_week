import 'dart:developer';

import 'package:dart_week/app/core/mixins/loader_mixin.dart';
import 'package:dart_week/app/core/mixins/messages_mixin.dart';
import 'package:dart_week/app/models/product_model.dart';
import 'package:dart_week/app/repositories/products/product_repository.dart';
import 'package:get/get.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log('erro ao buscar produtos', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao buscar produtos',
        type: MessageType.error,
      ));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } catch (e, s) {
      log('erro ao buscar produtos', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao buscar produtos',
        type: MessageType.error,
      ));
    }
  }
}
