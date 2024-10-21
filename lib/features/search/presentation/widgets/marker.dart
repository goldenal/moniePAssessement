import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Markerpoint extends StatelessWidget {
  final String txt;
  final double w;
  const Markerpoint({super.key, required this.txt, required this.w});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 161, 61, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r))),
      child: w < 82.w
          ? Icon(
              Icons.blinds_closed,
              color: Colors.white,
            )
          : Text(
              txt,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
    );
  }
}
