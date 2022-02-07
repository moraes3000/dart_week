import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:dart_week/app/models/order_pix.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/img/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                      'Pedido realizada dom sucesso, clique no botão abaixo para acessar o QRcode do Pix',
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline6?.copyWith(
                        color: context.theme.primaryColorDark,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    label: 'PIX',
                    onPressed: () {
                      Get.toNamed('/orders/pix', arguments: _orderPix);
                    },
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    label: 'Fechar',
                    onPressed: () {
                      Get.offAllNamed(
                        'home',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
