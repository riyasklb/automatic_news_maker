import 'package:automatic_news_maker/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For responsive UI

class GoogleLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo or Illustration
              // Image.asset(
              //   'assets/login_image.png', // Your login image or app logo here
              //   width: 200.w,
              //   height: 200.h,
              // ),
              SizedBox(height: 40.h),
              
              // Welcome Text with Google Font
              Text(
                'Welcome to MyApp',
                style: GoogleFonts.poppins( // Using Google Fonts
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),

              // Description Text with Google Font
              Text(
                'Sign in with your Google account to continue',
                style: GoogleFonts.roboto( // Using Google Fonts
                  fontSize: 16.sp,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),

              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(SubscriptionScreen());
                  // Add sign-in function here
                },
                icon: Image.asset(
                  'assets/images/signicon.jpg', // Google logo
                  height: 24.h,
                  width: 24.w,
                ),
                label: Text(
                  'Sign in with Google',
                  style: GoogleFonts.roboto( // Using Google Fonts
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w), backgroundColor: Colors.white, // Google brand color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Footer Text with Google Font
              Text(
                'By signing in, you agree to our Terms & Privacy Policy.',
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
