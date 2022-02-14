
import 'package:get/get.dart';
import 'package:getx_ecosystem/src/app/modules/pix/model/pix_key_details_model.dart';
import 'package:getx_ecosystem/src/core/network/network.dart';

import '../model/pix_key_model.dart';

abstract class IPixService {
  static IPixService get to => Get.find<IPixService>();

  Future<List<PixKeyModel>> keys();
  Future<PixKeyDetailsModel> keyDetails(int id);
}


class PixServiceImpl implements IPixService  {
  final INetwork _network = INetwork.to;

  @override
  Future<List<PixKeyModel>> keys() async {
    try {
      
      final response = await _network.pix.getPixKeys();
      return response?.map((x) => PixKeyModel.fromMap(x)).toList() ?? [];

    } catch (err) {
      throw err;
    }
  }

  @override
  Future<PixKeyDetailsModel> keyDetails(int id) async {
    try {
      final response = await _network.pix.getPixKeyDetails(id);
      return PixKeyDetailsModel.fromMap(response!);
    } catch (err) {
      throw err;
    }
  }
  
}