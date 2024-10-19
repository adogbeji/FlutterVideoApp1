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
}