import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/hover_controller.dart';
import '../../../routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TITLE FOR <TITLE> WHEN WEB 
    return Title(
      title: 'Título da página que irá aparecer na aba do navegador',
      color: Get.theme.primaryColor,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pagina inicial'),
        ),
        body: _handleBody(),
      ),
    );
  }

  Widget _handleBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _handleMenu(),
      ],
    );
  }

  Widget _handleMenu() {
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          _itemMenuBuilder('Pagamentos', FontAwesomeIcons.barcode, AppRoutes.PAYMENTS),
          _itemMenuBuilder('Recarga', FontAwesomeIcons.mobileAlt, AppRoutes.RECHARGE),
          _itemMenuBuilder('Pix', FontAwesomeIcons.university, AppRoutes.PIX),
        ],
      ),
    );
  }

  Widget _itemMenuBuilder(String title, IconData icon, String path) {
    return GetX<HoverController>(
      init: HoverController(),
      global: false,
      builder: (controller) {
        return GestureDetector(
          onTap: () => Get.toNamed(path),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (_) => controller.onHover(),
            onExit: (_) => controller.offHover(), 
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                   margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: controller.hover ? Colors.white : Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.deepPurple, width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Center(
                    child: FaIcon(icon, color: controller.hover ? Colors.deepPurple : Colors.white, size: 32),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}