import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'package:video_app_1/models/utils/global.dart';

import 'package:video_player/video_player.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({super.key, required this.videoFile, required this.videoPath});

  final File videoFile;
  final String videoPath;

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  VideoPlayerController? playerController;
  TextEditingController artistSongTextEditingController = TextEditingController();
  TextEditingController descriptionTagsTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });

    playerController!.initialize();  // Opens up video
    playerController!.play();  // Starts video
    playerController!.setVolume(2);  // Sets volume
    playerController!.setLooping(true);  // Allows autoplay

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    playerController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // VIDEO PLAYER
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              child: VideoPlayer(playerController!),
            ),

            showProgressBar == true 
            ? Container(
              child: const SimpleCircularProgressBar(
                progressColors: [
                  Colors.red,
                  Colors.pink,
                  Colors.green,
                ],
                animationDuration: 3,
                backColor: Colors.white38,
              ),
            )
            : Column(),
          ],
        ),
      ),
    );
  }
}