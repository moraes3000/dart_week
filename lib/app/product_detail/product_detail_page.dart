import 'package:dart_week/app/core/ui/formatter_helper.dart';
import 'package:dart_week/app/core/ui/vakinha_ui.dart';
import 'package:dart_week/app/core/ui/widgets/plus_minus_box.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:dart_week/app/core/ui/widgets/vakinha_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.width,
                height: context.heightTransformer(reducedBy: 60),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://s2.glbimg.com/-on4mnFlw5G3RI4sFYUyPcsE5lE=/620x466/e.glbimg.com/og/ed/f/original/2021/05/26/burger_nou.jpeg',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'X_TUDO',
                  style: context.textTheme.headline4!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'X_TUDO',
                  style: context.textTheme.bodyText2!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PlusMinusBox(
                label: 'Xtudo',
                minusCallback: () {},
                plusCallback: () {},
                price: 6.00,
                quantity: 1,
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Total',
                  style: VakinhaUI.textBold,
                ),
                trailing: Text(
                  FormatterHelper.formatcurrency(200),
                  style: VakinhaUI.textBold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child:
                          VakinhaButton(label: 'Adicionar', onPressed: () {}))),
            ],
          ),
        ));
      }),
    );
  }
}
