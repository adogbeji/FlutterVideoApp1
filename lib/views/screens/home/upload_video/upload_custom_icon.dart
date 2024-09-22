import 'package:flutter/material.dart';

class UploadCustomIcon extends StatelessWidget {
  const UploadCustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 46,
      height: 32,
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.add,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}