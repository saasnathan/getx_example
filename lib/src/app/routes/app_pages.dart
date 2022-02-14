import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../modules/home/view/home_page.dart';
import '../modules/payments/view/payments_page.dart';
import '../modules/pix/binds/key_binds.dart';
import '../modules/pix/binds/pix_bings.dart';
import '../modules/pix/view/keys/details/pix_key_details.dart';
import '../modules/pix/view/keys/pix_keys_page.dart';
import '../modules/pix/view/pix_page.dart';
import '../modules/pix/view/qr-code/qr-code_page.dart';
import '../modules/recharge/view/recharge_page.dart';

part 'app_routes.dart';

class AppPages {
  static List<GetPage> get pages => [
        GetPage(
            name: _Paths.HOME,
            page: () => const HomePage(),
            preventDuplicates: true,
            children: [
              GetPage(
                  name: _Paths.PIX,
                  page: () => PixPage(),
                  preventDuplicates: true,
                  bindings: [PixBings()],
                  children: [
                    GetPage(
                        name: _Paths.KEYS,
                        preventDuplicates: true,
                        bindings: [KeysBinds()],
                        participatesInRootNavigator: true,
                        page: () => PixKeysPage(),
                        children: [
                          GetPage(
                              name: _Paths.DETAILS,
                              page: () => PixKeyDetails(int.tryParse(Get.parameters['id'] ?? '')),
                              preventDuplicates: true)
                        ]),
                    GetPage(
                        name: _Paths.QR_CODE,
                        preventDuplicates: true,
                        page: () => QrCodePage())
                  ]),
              GetPage(
                  name: _Paths.RECHARGE,
                  preventDuplicates: true,
                  page: () => RechargePage()),
              GetPage(
                  name: _Paths.PAYMENTS,
                  preventDuplicates: true,
                  page: () => PaymentsPage())
            ])
      ];
}
