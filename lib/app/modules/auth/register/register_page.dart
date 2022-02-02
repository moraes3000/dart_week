import 'package:dart_week/app/core/ui/vakinha_state.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_text_formfield.dart';
import 'package:dart_week/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextFormfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextFormfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email invalido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextFormfield(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatório'),
                      Validatorless.min(6, 'minimo 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextFormfield(
                      label: 'Confirme a senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirme a senha'),
                        Validatorless.compare(_passwordEC, 'senha diferente'),
                      ])),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaButton(
                    width: context.width,
                    label: 'Cadastrar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        controller.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
