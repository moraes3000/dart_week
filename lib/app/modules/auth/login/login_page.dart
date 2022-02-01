import 'package:dart_week/app/core/ui/vakinha_ui.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
                      ),
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
                      VakinhaButton(
                        width: context.width,
                        label: 'Entrar',
                        onPressed: () {},
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/auth/register');
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: VakinhaUI.textBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
