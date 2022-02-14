import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_ecosystem/src/app/routes/app_pages.dart';

import '../../controller/keys_controller.dart';
import '../../model/pix_key_model.dart';

class PixKeysPage extends GetView<KeysController> {
  const PixKeysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TITLE FOR <TITLE> WHEN WEB 
    return Title(
      title: 'Título da página que irá aparecer na aba do navegador',
      color: Get.theme.primaryColor,
      child: Scaffold(
        appBar: AppBar(
           leading: InkWell(
             onTap: () => Get.back(),
             child: Center(child: FaIcon(FontAwesomeIcons.angleLeft))),
          title: const Text('Minhas Chaves - Pix'),
        ),
        body: _handleBody(),
      ),
    );
  }

  Widget _handleBody() {
    return Row(
      children: [
        Expanded(
          child: Obx(() => controller.loading.value ?_loading() : _handleListKeys())),
        Expanded(
          child: GetRouterOutlet.builder(
            routerDelegate: Get.nestedKey(AppRoutes.PIXKEYS),
            builder: (context) {
              return GetRouterOutlet(
                anchorRoute: AppRoutes.PIXKEYS,
                initialRoute: AppRoutes.PIXKEYSDETAILS(null),
              );
            }
          ),
        )
      ],
    );
  }

  Widget _handleListKeys() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text('Lista de chaves', style: Get.theme.textTheme.headline5),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.pixKeys.length,
              itemBuilder: (BuildContext context, int index) => _handleItemBuilder(controller.pixKeys[index])),
          ),
        ],
      ),
    );
  }

  Widget _handleItemBuilder(PixKeyModel data) {
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.PIXKEYSDETAILS(data.id)),
      leading: FaIcon(FontAwesomeIcons.key, size: 18, color: Colors.deepPurple),
      trailing: FaIcon(FontAwesomeIcons.angleRight, size: 16),
      title: Text(data.data, style: Get.theme.textTheme.subtitle1),
      subtitle: Text(data.type.name, style: Get.theme.textTheme.overline),
    );
  }

  Widget _loading() {
    return Container(
      alignment: Alignment.center,
      child: Text('Carregando...'),
    );
  }
}
