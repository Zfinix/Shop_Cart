import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart/providers/homeController.dart';

import 'views/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => HomeController()),
      ],
      child: Consumer<HomeController>(builder: (context, counter, _) {
        return MaterialApp(
          title: 'Material Card Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ProductSans',
            primaryColor: Color.fromRGBO(243, 113, 95, 1),
          ),
          home: HomePage(),
        );
      }),
    );
  }
}
