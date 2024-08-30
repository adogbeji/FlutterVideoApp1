import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  static AuthController instanceAuth = Get.find();  // Stores instance of AuthController class
  late Rx<User?> _currentUser;  // Stores instance of user
}