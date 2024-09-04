import 'package:flutter/material.dart';

class ProfilePictureOptions extends StatelessWidget {
  const ProfilePictureOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Pick your profile picture!'),
          Row(
            children: [
              Column(
                children: [
                  const Text('Gallery'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_album_outlined),
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
