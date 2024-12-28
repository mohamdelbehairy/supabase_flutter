import 'dart:io';

abstract class ImageRepo {
  Future<File?> pickImage();
}
