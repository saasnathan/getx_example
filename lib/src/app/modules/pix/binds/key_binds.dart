
import 'package:get/get.dart';

import '../controller/keys_controller.dart';
import '../service/pix_service.dart';


class KeysBinds extends Binding {

  @override
  List<Bind> dependencies() => [
      Bind.lazyPut(() => KeysController(Get.find<IPixService>()))
  ];
  
}