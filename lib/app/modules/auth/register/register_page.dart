import 'package:dart_week/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  const VakinhaTextFormfield(label: 'Nome'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormfield(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormfield(label: 'Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormfield(label: 'Confirme a senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaButton(
                    width: context.width,
                    label: 'Cadastrar',
                    onPressed: () {},
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
