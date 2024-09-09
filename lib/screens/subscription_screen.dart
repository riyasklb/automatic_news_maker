import 'package:automatic_news_maker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Subscription Plans',
          style: GoogleFonts.poppins(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // Description Text
            Text(
              'Unlock all premium features with a subscription plan',
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30.h),

            // Subscription Plan Cards
            buildSubscriptionPlan(
              'Monthly Plan',
              '\$9.99 / month',
              ['Unlimited access', 'Ad-free experience', 'Priority support'],
              context,
            ),
            SizedBox(height: 20.h),
            buildSubscriptionPlan(
              'Yearly Plan',
              '\$99.99 / year',
              ['Unlimited access', 'Ad-free experience', 'Priority support', 'Save 20%'],
              context,
            ),
            SizedBox(height: 30.h),

            // Free Trial Button
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(VideoMakerHomeScreen());
                  // Handle free trial action
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 40.w), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  'Start Free Trial',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget buildSubscriptionPlan(String title, String price, List<String> features, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.blue[50],
        border: Border.all(color: Colors.blueAccent, width: 1.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Title and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Features List
          ...features.map((feature) => Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.blueAccent, size: 18.w),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    feature,
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
