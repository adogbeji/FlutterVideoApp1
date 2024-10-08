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
          Container(
            width: 40,
            margin: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          Container(
            width: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
      
          Center(
            child: Container(
              width: 40,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
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