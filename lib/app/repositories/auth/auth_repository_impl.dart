import 'dart:developer';

import 'package:dart_week/app/core/exceptions/user_notfound_exception.dart';
import 'package:dart_week/app/core/rest_client/rest_client.dart';
import 'package:dart_week/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registar o usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message, result.statusCode);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          "Usuário ou senha invalidos",
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotfoundException();
      }

      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(
          'Erro ao autenticar o usuários', result.statusCode);
    }

    return UserModel.fromMap(result.body);
  }
}
