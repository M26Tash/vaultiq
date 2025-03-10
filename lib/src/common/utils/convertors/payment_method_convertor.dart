import 'package:vaultiq/src/common/constants/app_assets.dart';
import 'package:vaultiq/src/common/utils/enum/payment_method.dart';

abstract final class PaymentMethodConvertor {
  static PaymentMethod convertToEnum(String value) => switch (value) {
        'amex' => PaymentMethod.amex,
        'jcb' => PaymentMethod.jcb,
        'mc' => PaymentMethod.mc,
        'mir' => PaymentMethod.mir,
        'upi' => PaymentMethod.upi,
        'visa' => PaymentMethod.visa,
        _ => throw UnimplementedError('Invalid ENUM'),
      };

  static String convertToAsset (PaymentMethod value) => switch (value) {
    PaymentMethod.amex => AppAssets.americanExpressLogo,
    PaymentMethod.jcb => AppAssets.jcbLogo,
    PaymentMethod.mc => AppAssets.mastercardLogo,
    PaymentMethod.mir => AppAssets.mirLogo,
    PaymentMethod.upi => AppAssets.unionPayLogo,
    PaymentMethod.visa => AppAssets.visaLogo,
  };
}
