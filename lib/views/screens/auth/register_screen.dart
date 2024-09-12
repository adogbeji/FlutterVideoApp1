import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:video_app_1/controllers/auth_controller.dart';
import 'package:video_app_1/utils/show_snack_bar.dart';

import 'package:video_app_1/views/widgets/profile_picture_options.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var authController = AuthController.instanceAuth;  // Stores instance of AuthController

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form key

  late String email;

  late String name;

  late String phoneNumber;

  late String password;

  bool _isLoading = false;

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

  // Calls function in AuthController class
  void _registerUser() {
    setState(() {
      _isLoading = true;
    });

    if (authController.profileImage != null && name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      
      // Creates new user account
      authController.createAccountForNewUser(
        authController.profileImage!, 
        name, 
        email, 
        password
      );

      return showSnack(context, 'Congrats, your account has been created!');
    } else {
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'Fields must not be empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must not be empty!';
                      } else {
                        return null;  // Does nothing
                      }
                    },
                    onChanged: (value) {
                      name = value;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty!';
                      } else {
                        return null;  // Does nothing
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone number must not be empty!';
                      } else {
                        return null;  // Does nothing
                      }
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password not be empty!';
                      } else {
                        return null;  // Does nothing
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
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
                    onTap: _registerUser,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _isLoading ? const CircularProgressIndicator(
                        color: Colors.white,
                      ): const Center(
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
      ),
    );
  }
}
