
import 'package:get/get_state_manager/get_state_manager.dart';

import '../service/pix_service.dart';

class PixBings extends Binding {

  @override
  List<Bind> dependencies() => [
    Bind.lazyPut<IPixService>(() => PixServiceImpl())
  ];
  
}