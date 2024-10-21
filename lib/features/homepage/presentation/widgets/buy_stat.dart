import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyStat extends StatelessWidget {
  final double size;
   final String val;
  const BuyStat({super.key, required this.size,required this.val});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: size,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 800),
      child: Container(
        width: 160.w,
        height: 160.w,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 161, 61, 1),
          shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            Text(
              "BUY",
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              val,
              style: GoogleFonts.poppins(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              "offers",
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
