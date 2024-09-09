import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:video_app_1/controllers/auth_controller.dart';

import 'package:video_app_1/views/widgets/profile_picture_options.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var authController = AuthController.instanceAuth;  // Stores instance of AuthController

  Uint8List? _image;  // Stores picked image

  void _openModal() {
    showModalBottomSheet(context: context, builder: (ctx) {
      return ProfilePictureOptions(authController, selectGalleryImage, selectCameraImage);
    });
  }

  // Picks image from phone gallery
  selectGalleryImage() async {
    Uint8List im = await authController.pickProfileImage(ImageSource.gallery);  // Stores picked image

    setState(() {
      _image = im;
    });
  }

  // Captures image with device camera
  selectCameraImage() async {
    Uint8List im = await authController.pickProfileImage(ImageSource.camera);  // Stores captured image

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),

                Stack(
                  children: [
                    _image != null ? CircleAvatar(
                      radius: 52,
                      backgroundImage: MemoryImage(_image!),
                    ): const CircleAvatar(
                      radius: 52,
                      child: Icon(
                        Icons.person,
                        size: 55,
                      ),
                    ),
                    Positioned(
                      right: -12,
                      // top: 10,
                      child: IconButton(
                        onPressed: _openModal,
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),

                // NAME INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter Name...',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                // EMAIL INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email...',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                  ),
                ),

                const SizedBox(height: 8,),

                // PHONE NUMBER INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Enter Phone...',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 8,),

                // PASSWORD INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password...',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 12,),

                // REGISTER BUTTON
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign in.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
