import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recarga'),
        leading: InkWell(
            onTap: () => Get.back(),
            child: Center(child: FaIcon(FontAwesomeIcons.angleLeft))),
      ),
      body: Container(),
    );
  }
}
