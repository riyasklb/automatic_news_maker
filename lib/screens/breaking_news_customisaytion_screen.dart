import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreakingNewsCustomisationScreen extends StatefulWidget {
  @override
  _BreakingNewsCustomisationScreenState createState() => _BreakingNewsCustomisationScreenState();
}

class _BreakingNewsCustomisationScreenState extends State<BreakingNewsCustomisationScreen> {
  String breakingNewsText = "Breaking News Example"; // Default text
  double fontSize = 20.0; // Default font size
  Color textColor = Colors.white; // Default text color
  Color backgroundColor = Colors.red; // Default background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Breaking News',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input for Breaking News Text
              Text(
                'Breaking News Content',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                onChanged: (text) {
                  setState(() {
                    breakingNewsText = text;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Enter breaking news text...',
                ),
              ),
              SizedBox(height: 30.h),

              // Font Size Customization
              Text(
                'Font Size',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Slider(
                value: fontSize,
                min: 12.0,
                max: 40.0,
                divisions: 14,
                label: '${fontSize.toInt()}',
                onChanged: (value) {
                  setState(() {
                    fontSize = value;
                  });
                },
              ),
              SizedBox(height: 20.h),

              // Text Color Customization
              Text(
                'Text Color',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  colorSelectionButton(Colors.white),
                  SizedBox(width: 10.w),
                  colorSelectionButton(Colors.black),
                  SizedBox(width: 10.w),
                  colorSelectionButton(Colors.yellow),
                ],
              ),
              SizedBox(height: 30.h),

              // Background Color Customization
              Text(
                'Background Color',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  colorSelectionButton(Colors.red),
                  SizedBox(width: 10.w),
                  colorSelectionButton(Colors.blue),
                  SizedBox(width: 10.w),
                  colorSelectionButton(Colors.green),
                ],
              ),
              SizedBox(height: 40.h),

              // Preview Section
              Text(
                'Preview',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                color: backgroundColor,
                child: Center(
                  child: Text(
                    breakingNewsText,
                    style: GoogleFonts.poppins(
                      fontSize: fontSize.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              // Save and Preview Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save logic here
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Preview logic here
                    },
                    child: Text('Preview'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Color Selection Button for Customization
  Widget colorSelectionButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (color == Colors.red || color == Colors.blue || color == Colors.green) {
            backgroundColor = color;
          } else {
            textColor = color;
          }
        });
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
