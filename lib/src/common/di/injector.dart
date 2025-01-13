import 'package:get_it/get_it.dart';
import 'package:vaultiq/src/common/di/cubit_module.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initSharedCubits();
  initCubits();
}
