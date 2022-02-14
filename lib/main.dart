import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecosystem/src/app/routes/app_pages.dart';
import 'package:getx_ecosystem/src/core/network/network.dart';

void main() async {
  await Get.putAsync<INetwork>(() => NetworkImpl.load());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Structure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple
        )
      ),
      defaultTransition: Transition.fade,
      transitionDuration: Duration(milliseconds: 50), 
      getPages: AppPages.pages,
      initialRoute: '/',
    );
  }
}