import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadController extends GetxController {
  
  // Compresses Video
  compressVideoFile(String videoFilePath) async {
    final compressedVideoFilePath = await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.LowQuality);  // Stores compressed video file path
  
    return compressedVideoFilePath;  // Returns compressed video
  }
  
  // Uploads Compressed Video
  uploadCompressedVideo(String videoID, String videoFilePath) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
                                                .ref()
                                                .child('videos')
                                                .child(videoID)
                                                .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;

    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores download URL

    return downloadURL;
  }

  // Gets Video Thumbnail
  getThumbnailImage(String videoFilePath) async {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);  // Stores thumbnail image

    return thumbnailImage;
  }

  // Uploads Thumbnail Image
  uploadThumbnailImage(String videoID, String videoFilePath) async {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance
                                                .ref()
                                                .child('All Thumbnails')
                                                .child(videoID)
                                                .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailUploadTask;

    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores download URL

    return downloadURL;
  }

  // Saves Video Details In Firestore Database
  saveVideoInfo(String artistSongName, String descriptionTags, String videoFilePath, BuildContext context) async {

    try {
      String videoID = DateTime.now().millisecondsSinceEpoch.toString();  // Stores video ID as timestamp
    
      // 1) Upload Video to Firebase Storage
      String videoDownloadURL = await uploadCompressedVideo(videoID, videoFilePath);  // Stores video download URL

      // 2) Upload Thumbnail To Firebase Storage
      String thumbnailDownloadURL = uploadThumbnailImage(videoID, videoFilePath);  // Stores thumbnail download URL
    
      // 3) Save Video Info To Firestore Database
    } catch (errMsg) {
      Get.snackbar(
        'Upload Failed!', 
        'Sorry, your video could not be uploaded. Try again.'
      );
    }
  }
}