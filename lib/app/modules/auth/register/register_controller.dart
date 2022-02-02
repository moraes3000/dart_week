import 'package:dart_week/app/core/mixins/loader_mixin.dart';
import 'package:dart_week/app/core/mixins/messages_mixin.dart';
import 'package:dart_week/app/core/rest_client/rest_client.dart';
import 'package:dart_week/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required}) async {
    try {
      _loading.toggle();
      await _authRepository.register(
        name,
        email,
        password,
      );
      _loading.toggle();
      // TODO: Voltar quando fizer o login
      Get.back();
      _message(MessageModel(
        title: 'Sucesso',
        message: 'Cadastro realizado com sucesso',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle();
      // log('Erro ao registar login', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'error',
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e) {
      _message(MessageModel(
        title: 'error',
        message: 'erro ao registrar',
        type: MessageType.error,
      ));
    }
  }

  // void qualquer() {
  //   message.value = MessageModel(
  //     title: 'teste',
  //     message: 'mensagem de  teste',
  //     type: MessageType.info,
  //   );
  //   // loading.toggle();

  //   // Future.delayed(Duration(seconds: 2), () => loading.toggle());
  // }
}
