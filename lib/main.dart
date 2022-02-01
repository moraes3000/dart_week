import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/auth_routers.dart';
import 'app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
