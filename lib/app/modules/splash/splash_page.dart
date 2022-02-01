import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/img/hamburger.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85),
                  ),
                  Image.asset(
                    'assets/img/header.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  VakinhaButton(
                    label: 'Acessar',
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                    height: 35,
                    width: context.widthTransformer(
                      reducedBy: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
