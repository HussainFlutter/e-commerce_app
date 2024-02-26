

import 'package:image_picker/image_picker.dart';

abstract class UploadImageRepo{
  Future<void> uploadImage (XFile image);
  Future<String> getImageUrl(String imagePath);
}