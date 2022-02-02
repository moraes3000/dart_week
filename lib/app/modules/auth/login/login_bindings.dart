import 'package:dart_week/app/modules/auth/login/login_controller.dart';
import 'package:dart_week/app/modules/auth/register/register_controller.dart';
import 'package:dart_week/app/repositories/auth/auth_repository.dart';
import 'package:dart_week/app/repositories/auth/auth_repository_impl.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
