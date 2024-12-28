import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._imageRepo) : super(UploadImageInitial());
  final ImageRepo _imageRepo;

  String? imageUrl;

  Future<String?> uploadImage(File image) async {
    emit(UploadImageLoading());
    try {
      imageUrl = await _imageRepo.uploadImage(image);

      if (imageUrl != null) {
        emit(UploadImageSuccess());
        return imageUrl;
      }
    } catch (e) {
      emit(UploadImageFailure());
      log("error from upload image: $e");
    }
    return null;
  }

  @override
  void onChange(Change<UploadImageState> change) {
    log("change: $change");
    super.onChange(change);
  }
}
