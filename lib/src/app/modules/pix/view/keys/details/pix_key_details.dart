import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/key_details_controller.dart';
import '../../../model/pix_key_details_model.dart';

class PixKeyDetails extends StatelessWidget {
  final int? id;

  PixKeyDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: id != null ? _handleBody() : _errorMissingParameter(),
    );
  }

  Widget _handleBody() {
    return GetBuilder(
        init: KeyDetailsController(id!),
        global: false,
        builder: (KeyDetailsController ctrl) {
          return ctrl.obx(
              (PixKeyDetailsModel? state) => _handleContenteDetails(state!),
              onLoading: _loadingDetails(),
              onError: (err) => _errorLoadingDetails());
        });
  }

  Widget _handleContenteDetails(PixKeyDetailsModel state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text('Detalhes da chave:', style: Get.theme.textTheme.headline5),
          ),
          _itemBuilder('Data de criação', state.createdAt.toString()),
          _itemBuilder('Status', state.status.name)
        ],
      ),
    );
  }

  Widget _itemBuilder(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Get.theme.textTheme.headline6),
            Text(data, style: Get.theme.textTheme.headline6?.merge(TextStyle(fontWeight: FontWeight.w300)))
          ],
        );
  }

  Widget? _loadingDetails() {
    return null;
  }

  Widget _errorLoadingDetails() {
    return Container();
  }

  Widget _errorMissingParameter() {
    return Container(
      alignment: Alignment.center,
      child: Text('Selecione uma chave!'),
    );
  }
}
