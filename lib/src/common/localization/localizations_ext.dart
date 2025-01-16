import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/localization/flutter_gen/vaultiq_localizations.dart';

extension LocalizationsExt on BuildContext {
  VaultiqLocalization get locale => VaultiqLocalization.of(this);
}
