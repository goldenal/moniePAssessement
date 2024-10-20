import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RentStat extends StatelessWidget {
  final double size;
 final String val;
  const RentStat({super.key, required this.size,required this.val});

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
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            Text(
              "RENT",
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromRGBO(163, 149, 129, 1)),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "$val",
              style: GoogleFonts.poppins(
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(163, 149, 129, 1)),
            ),
            Text(
              "offers",
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromRGBO(163, 149, 129, 1)),
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
