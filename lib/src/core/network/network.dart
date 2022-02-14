
import 'package:get/get.dart';

import 'pix_api/pix_api.dart';

abstract class INetwork {
  static INetwork get to => Get.find<INetwork>();
  
  PixApi get pix;
}


class NetworkImpl implements INetwork {
  
  static Future<INetwork> load() async {
    //SETUP CONNECTION
    await Future.delayed(Duration(seconds: 1));
    return NetworkImpl();
  }

  @override
  PixApi get pix => PixApi();
}