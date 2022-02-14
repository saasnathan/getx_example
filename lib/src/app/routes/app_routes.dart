part of 'app_pages.dart';

class AppRoutes {

  static const PIX = _Paths.PIX;
  static const PIXKEYS = _Paths.PIX + _Paths.KEYS;
  static PIXKEYSDETAILS(dynamic id) => PIXKEYS + _Paths.DETAILS.replaceAll(':id', '$id');
  static const PIXQRCODE = _Paths.PIX + _Paths.QR_CODE;

  static const PAYMENTS = _Paths.PAYMENTS;
  static const RECHARGE = _Paths.RECHARGE;
  
}

class _Paths {
  static const String HOME = '/';

  static const String PIX = '/pix';
  static const String KEYS = '/keys';
  static const String QR_CODE = '/qr-code';

  static const String DETAILS = '/:id';
  
  static const String PAYMENTS = '/payments';
  static const String RECHARGE = '/recharge';
}