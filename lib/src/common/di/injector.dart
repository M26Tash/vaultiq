import 'package:get_it/get_it.dart';
import 'package:vaultiq/src/common/di/cubit_module.dart';
import 'package:vaultiq/src/common/di/data_source_model.dart';
import 'package:vaultiq/src/common/di/interactors_module.dart';
import 'package:vaultiq/src/common/di/repositories_module.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initSharedCubits();
  initCubits();
  initDataSource();
  initRepositories();
  initInteractors();
}
