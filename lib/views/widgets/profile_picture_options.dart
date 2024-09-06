import 'package:flutter/material.dart';

import 'package:video_app_1/controllers/auth_controller.dart';

class ProfilePictureOptions extends StatelessWidget {
  ProfilePictureOptions(this._authController, {super.key});

  final AuthController _authController;

  // var authController = AuthController.instanceAuth;  // Stores instance of AuthController

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Pick your profile picture!'),

          const SizedBox(height: 35,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('Gallery'),
                  IconButton(
                    onPressed: () {
                      // AuthController().chooseImageFromGallery();
                      _authController.chooseImageFromGallery();
                    },
                    icon: const Icon(Icons.photo_album_outlined),
                  ),
                ],
              ),

              Column(
                children: [
                  const Text('Camera'),
                  IconButton(
                    onPressed: () {
                      // AuthController().captureImageWithCamera();
                      _authController.captureImageWithCamera();
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
