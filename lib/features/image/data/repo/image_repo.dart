import 'dart:io';

abstract class ImageRepo {
  Future<File?> pickImage();
  Future<String> uploadImage(File image);
}
