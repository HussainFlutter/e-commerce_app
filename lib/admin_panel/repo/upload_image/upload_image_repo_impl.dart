import 'dart:io';
import 'package:e_commerce_app2/admin_panel/repo/upload_image/upload_image_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepoImpl extends UploadImageRepo{
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Future<void> uploadImage(XFile image)async{
    await storage.ref("products_image/${image.name}").putFile(File(image.path));
  }
  @override
  Future<String> getImageUrl(String imagePath)async{
    return await storage.ref("products_image/$imagePath").getDownloadURL();
  }
}