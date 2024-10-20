import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassmorphismCard extends StatelessWidget {
  final String txt;
  final double fontSize, height1, height2;
  final bool isSmallBox;

  const GlassmorphismCard(
      {super.key,
      required this.txt,
      this.fontSize = 16,
      required this.height1,
      required this.height2,
      required this.isSmallBox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Container(
          height: height1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                child: Text(
                  txt,
                  style: GoogleFonts.poppins(
                    fontSize: fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 0,
                top: 0,
                child: Container(
                  height: height2,
                  width: height2,
                  padding: EdgeInsets.all(20.w),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 9.w,
                      color: const Color(0xffa5957e),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
