import 'package:dart_week/app/core/ui/formatter_helper.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dart_week/app/models/order_pix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PixPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCore = Uri.parse(_orderPix.image).data;
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Valo a pagar', style: context.textTheme.headline4),
                Text(
                  FormatterHelper.formatcurrency(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Image.network(
                //   'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Link_pra_pagina_principal_da_Wikipedia-PT_em_codigo_QR_b.svg/280px-Link_pra_pagina_principal_da_Wikipedia-PT_em_codigo_QR_b.svg.png',
                //   width: context.widthTransformer(reducedBy: 50),
                //   height: context.heightTransformer(reducedBy: 50),
                // ),
                // Image.memory(
                //   qrCore!.contentAsBytes(),
                //   width: context.widthTransformer(reducedBy: 50),
                //   height: context.heightTransformer(reducedBy: 50),
                // ),
                Image.asset(
                  'assets/img/qrcode.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50),
                ),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _orderPix.code));
                    Get.rawSnackbar(
                      message: 'Codigo pix copiado',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: TextButton.styleFrom(primary: Colors.grey),
                  child: Text(
                    'Pix copiar e colar',
                    style: context.textTheme.headline4?.copyWith(
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
