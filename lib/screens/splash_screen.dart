import 'package:automatic_news_maker/screens/google_login_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
     _navigateToHome();
    super.initState();
    // Navigate to HomeScreen after 3 seconds
   
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {
      Get.off(GoogleLoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo or splash image here
            // Image.asset(
            //   'assets/logo.png', // Add your image path here
            //   width: 150.w, // Using ScreenUtil for responsive sizing
            //   height: 150.h,
            // ),
            SizedBox(height: 20.h),
            Text(
              'Welcome to MyApp',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            // You can add a CircularProgressIndicator or a custom loading animation here
            CircularProgressIndicator(
              color: Colors.blue, // Customize loading indicator color
            ),
          ],
        ),
      ),
    );
  }
}
