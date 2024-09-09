import 'package:automatic_news_maker/screens/create_video_scrren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoMakerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Soft background color
      appBar: AppBar(
        title: Text(
          'Breaking News Video Maker',
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
            // Welcome Section
            Text(
              'Welcome, Editor!',
              style: GoogleFonts.poppins(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Let\'s start creating amazing breaking news videos:',
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30.h),

            // Options for Video Creation with Grid Layout
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two options per row
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.1, // Make items slightly taller
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return buildVideoOptionCard(
                  context,
                  title: _getFeatureTitle(index),
                  icon: _getFeatureIcon(index),
                  color: _getCardColor(index),
                );
              },
            ),
            SizedBox(height: 20.h),

            // Recent Projects Section
            Text(
              'Recent Video Projects',
              style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Adjust based on recent video projects
                itemBuilder: (context, index) {
                  return buildVideoProjectCard(context, 'Video Project ${index + 1}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Feature Card Widget for Video Creation Options
  Widget buildVideoOptionCard(BuildContext context, {required String title, required IconData icon, required Color color}) {
    return GestureDetector(
      onTap: () {
        Get.to(CreateNewVideoScreen());
        // Handle feature navigation here
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8.r,
              offset: Offset(0, 6.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.w,
              color: Colors.white,
            ),
            SizedBox(height: 15.h),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Card Widget for Recent Video Projects
  Widget buildVideoProjectCard(BuildContext context, String projectName) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.redAccent.withOpacity(0.2),
          ),
          child: Icon(Icons.play_circle_fill, color: Colors.redAccent, size: 30.w),
        ),
        title: Text(
          projectName,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Last edited: Today',
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
        onTap: () {
          // Navigate to video project details
        },
      ),
    );
  }

  // Get the feature title based on the index
  String _getFeatureTitle(int index) {
    switch (index) {
      case 0:
        return 'Create New Video';
      case 1:
        return 'Choose Template';
      case 2:
        return 'Manage Video Clips';
      case 3:
        return 'Review Drafts';
      default:
        return 'Feature';
    }
  }

  // Get the feature icon based on the index
  IconData _getFeatureIcon(int index) {
    switch (index) {
      case 0:
        return Icons.video_call;
      case 1:
        return Icons.style;
      case 2:
        return Icons.edit;
      case 3:
        return Icons.check_circle;
      default:
        return Icons.featured_video;
    }
  }

  // Get the card color based on the index
  Color _getCardColor(int index) {
    switch (index) {
      case 0:
        return Colors.blueAccent;
      case 1:
        return Colors.purpleAccent;
      case 2:
        return Colors.orangeAccent;
      case 3:
        return Colors.greenAccent;
      default:
        return Colors.blueAccent;
    }
  }
}
