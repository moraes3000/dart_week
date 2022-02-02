import 'package:dart_week/app/repositories/auth/auth_repository.dart';
import 'package:dart_week/app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
