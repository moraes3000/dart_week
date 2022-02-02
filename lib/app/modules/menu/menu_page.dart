import 'package:dart_week/app/modules/menu/widgets/product_tile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView.builder(
            itemCount: controller.menu.length,
            itemBuilder: (context, index) {
              final prod = controller.menu[index];
              return ProductTile(product: prod);
            },
          ),
        );
      }),
    );
  }
}
