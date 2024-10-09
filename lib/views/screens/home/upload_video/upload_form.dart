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
                : Column(
                    children: [
                      // ARTIST/SONG
                      TextFormField(
                        controller: artistSongTextEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Artist - Song',
                          hintText: 'Enter Artist - Song...',
                          prefixIcon: Icon(
                            Icons.music_video,
                            color: Colors.red,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      // DESCRIPTION TAGS
                      TextFormField(
                        controller: descriptionTagsTextEditingController,
                        decoration: const InputDecoration(
                          labelText: 'Description - Tags',
                          hintText: 'Enter Description - Tags...',
                          prefixIcon: Icon(
                            Icons.label,
                            color: Colors.red,
                          ),
                        ),
                      ),

                      // UPLOAD BUTTON
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 54,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
