import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';
import 'package:vaultiq/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:vaultiq/src/core/domain/interactors/data_interactor.dart';
import 'package:vaultiq/src/core/domain/interactors/file_interactor.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  final DataInteractor _dataInteractor;
  final FileInteractor _fileInteractor;
  MyAccountCubit(
    this._dataInteractor,
    this._fileInteractor,
  ) : super(
          const MyAccountState(
            route: CustomizedRoute(null, null),
            image: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<XFile?>? _imageSubscription;

  @override
  Future<void> close() {
    _imageSubscription?.cancel();
    _imageSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _imageSubscription?.cancel();
    _imageSubscription = _fileInteractor.imageStream.listen(
      _onNewImage,
    );

  }

  Future<void> updateProfile(ProfileModel profile) async {
    return _dataInteractor.updateProfile(profile);
  }


  Future<void> getImage() async {
    return _fileInteractor.getImage();
  }

  Future<void> _uploadAvatar(XFile? avatar) async {
    return _dataInteractor.uploadAvatar(avatar);
  }

  void _onNewImage(XFile? image) {
    emit(
      state.copyWith(
        image: image,
      ),
    );

    _uploadAvatar(image);
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
