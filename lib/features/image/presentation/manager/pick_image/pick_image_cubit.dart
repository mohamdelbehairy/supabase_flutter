import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/image_repo.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this._imageRepo) : super(PickImageInitial());
  final ImageRepo _imageRepo;

  File? image;
  Future<void> pickImage() async {
    emit(PickImageLoading());
    try {
      image = await _imageRepo.pickImage();
      if (image != null) {
        emit(PickImageSuccess());
      }
    } catch (e) {
      emit(PickImageFailure());
      log("error from pick image: $e");
    }
  }

  @override
  void onChange(Change<PickImageState> change) {
    log("change: $change");
    super.onChange(change);
  }
}
