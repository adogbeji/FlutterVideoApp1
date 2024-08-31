import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {

  static AuthController instanceAuth = Get.find();  // Stores instance of AuthController class
  late Rx<User?> _currentUser;  // Stores instance of user

  late Rx<File?> _pickedFile;  // Stores image user picked from phone gallery
  File? get profileImage => _pickedFile.value;


  // Picks image from phone gallery
  Future<void> chooseImageFromGallery() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);  // Stores picked image
  }
}