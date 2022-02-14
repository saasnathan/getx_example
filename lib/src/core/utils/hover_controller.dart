import 'package:get/get.dart';

class HoverController extends GetxController {
  final _hover = false.obs;

  bool get hover => _hover.value; 
  void onHover() => _hover.value = true;
  void offHover() => _hover.value = false;
}