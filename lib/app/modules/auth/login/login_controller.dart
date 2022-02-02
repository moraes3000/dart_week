import 'dart:math';

import 'package:dart_week/app/core/constants/constans.dart';
import 'package:dart_week/app/core/exceptions/user_notfound_exception.dart';
import 'package:dart_week/app/core/mixins/loader_mixin.dart';
import 'package:dart_week/app/core/mixins/messages_mixin.dart';
import 'package:dart_week/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogger = await _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(Constans.USER_KEY, userLogger.id);

      _loading.toggle();
    } on UserNotfoundException catch (e, s) {
      _loading.toggle();
      // log('Login ou senha invalidados', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Login ou senha invalidados',
        type: MessageType.error,
      ));
    } catch (e) {
      _loading.toggle();
      // log('Login ou senha invalidados', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'ao realizar o login',
        type: MessageType.error,
      ));
    }
  }
}
