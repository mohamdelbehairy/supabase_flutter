import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'image_repo.dart';

class ImageRepoImpl extends ImageRepo {
  @override
  Future<File?> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  @override
  Future<String> uploadImage(File image) async {
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    await Supabase.instance.client.storage
        .from("images")
        .upload("images/$imageName", image);

    return Supabase.instance.client.storage
        .from('images')
        .getPublicUrl('images/$imageName');
  }
}
