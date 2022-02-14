
import 'package:get/get.dart';

import '../model/pix_key_details_model.dart';
import '../service/pix_service.dart';

class KeyDetailsController extends GetxController with StateMixin<PixKeyDetailsModel> {
  final IPixService _service = IPixService.to;

  final int id; 
  
  KeyDetailsController(this.id);

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  Future<void> _load() async {
    return _service.keyDetails(id).then((value) {
      change(GetStatus.success(value));
      update();
    }).catchError((e) {
      change(GetStatus.error(e));
      update();
    });
  }
}