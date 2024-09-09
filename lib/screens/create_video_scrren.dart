import 'package:automatic_news_maker/screens/add_video_clip_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Create New Video',
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
            // Video Title Input
            Text(
              'Video Title',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                hintText: 'Enter your video title here...',
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 30.h),

            // Template Selection
            Text(
              'Choose Template',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              items: [
                DropdownMenuItem(
                  child: Text('Breaking News Template 1'),
                  value: 'Template 1',
                ),
                DropdownMenuItem(
                  child: Text('Breaking News Template 2'),
                  value: 'Template 2',
                ),
              ],
              onChanged: (value) {
                // Handle template selection
              },
              hint: Text('Select Template'),
            ),
            SizedBox(height: 30.h),

            // Add Media Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildAddMediaButton(context, 'Add Video Clip', Icons.video_collection, Colors.blueAccent),
                buildAddMediaButton(context, 'Add Image', Icons.image, Colors.purpleAccent),
              ],
            ),
            SizedBox(height: 40.h),

            // Preview and Save Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Preview video logic
                  },
                  child: Text('Preview'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 4,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save and Continue logic
                  },
                  child: Text('Save & Continue'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: Colors.greenAccent,
                    elevation: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Button Widget for Adding Media (Images, Videos)
  Widget buildAddMediaButton(BuildContext context, String label, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Get.to(AddVideoClipScreen());
        // Logic to add media
      },
      child: Column(
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, size: 45.w, color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
