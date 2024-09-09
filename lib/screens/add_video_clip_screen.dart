import 'package:automatic_news_maker/screens/add_reporter_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart'; // Add this package to handle video preview

class AddVideoClipScreen extends StatefulWidget {
  @override
  _AddVideoClipScreenState createState() => _AddVideoClipScreenState();
}

class _AddVideoClipScreenState extends State<AddVideoClipScreen> {
  VideoPlayerController? _controller; // Video controller for preview

  @override
  void dispose() {
    _controller?.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Video Clip',
          style: GoogleFonts.poppins(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instruction Text
            Text(
              'Upload or Record a Video',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),

            // Upload/Record Video Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildActionButton(context, 'Record Video', Icons.videocam, Colors.redAccent, onPressed: _recordVideo),
                buildActionButton(context, 'Upload from Gallery', Icons.video_library, Colors.blueAccent, onPressed: _uploadFromGallery),
              ],
            ),
            SizedBox(height: 30.h),

            // Video Preview Section
            if (_controller != null && _controller!.value.isInitialized)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preview',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_controller!.value.isPlaying) {
                            setState(() {
                              _controller!.pause();
                            });
                          } else {
                            setState(() {
                              _controller!.play();
                            });
                          }
                        },
                        child: Text(_controller!.value.isPlaying ? 'Pause' : 'Play'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _trimVideo,
                        child: Text('Trim Video'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            // Save Button
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(AddReporterDetailsScreen());
                  // Save and go back
                },
                child: Text('Save & Continue'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Action Button Widget (for Record Video, Upload Video)
  Widget buildActionButton(BuildContext context, String label, IconData icon, Color color, {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: color, width: 2.w),
            ),
            child: Icon(icon, size: 40.w, color: color),
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle recording video (placeholder)
  void _recordVideo() {
    // Logic to record a video
    setState(() {
      _controller = VideoPlayerController.network(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    });
  }

  // Function to handle uploading video from gallery (placeholder)
  void _uploadFromGallery() {
    // Logic to upload a video from the gallery
    setState(() {
      _controller = VideoPlayerController.network(
          'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4')
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  // Function to handle trimming the video (placeholder)
  void _trimVideo() {
    // Logic for trimming the video
  }
}
