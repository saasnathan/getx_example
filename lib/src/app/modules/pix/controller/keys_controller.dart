
import 'package:get/get.dart';

import '../model/pix_key_model.dart';
import '../service/pix_service.dart';

class KeysController extends GetxController {
  final IPixService _service;
  final loading = true.obs;

  RxList<PixKeyModel> pixKeys = RxList<PixKeyModel>();

  KeysController(this._service);

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    try {
      
    pixKeys.value = await _service.keys();
    loading.value = false;

    } catch (err) {
      
    }
  }

  @override
  void onClose() {
    pixKeys.value = [];
    super.onClose();
  }
}
