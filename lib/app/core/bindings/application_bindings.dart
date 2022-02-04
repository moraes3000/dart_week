import 'package:dart_week/app/core/rest_client/rest_client.dart';
import 'package:dart_week/app/core/services/shopping_card_service.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    //
    Get.lazyPut(() => ShoppingCardService());
  }
}
