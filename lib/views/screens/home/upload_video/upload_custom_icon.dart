import 'package:flutter/material.dart';

class UploadCustomIcon extends StatelessWidget {
  const UploadCustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 32,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 40,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}