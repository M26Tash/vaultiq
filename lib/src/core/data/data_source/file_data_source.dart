import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';
import 'package:vaultiq/src/core/data/data_source/interfaces/i_file_data_source.dart';
import 'package:vaultiq/src/core/domain/utils/core_logger.dart';

final class FileDataSource implements IFileDataSource {
  final BehaviorSubject<XFile?> _imageSubject = BehaviorSubject();

  final BehaviorSubject<XFile?> _photoSubject = BehaviorSubject();

  @override
  Stream<XFile?> get imageStream => _imageSubject;

  @override
  Stream<XFile?> get photoStream => _photoSubject;

  @override
  Future<void> getImage() async {
    try {
      final picker = ImagePicker();

      final image = await picker.pickImage(source: ImageSource.gallery);

      _imageSubject.add(image);
    } on PlatformException catch (e) {
      CoreLogger.errorLog(
        'getImage()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }

  @override
  Future<void> capturePhoto() async {
    try {
      // final picker = ImagePicker();
      // final photo = await picker.pickImage(source: ImageSource.camera);
    } on PlatformException catch (e) {
      CoreLogger.errorLog(
        'capturePhoto()',
        params: {
          'Caught error': e.message,
        },
      );
    }
  }
}
