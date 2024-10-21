import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Markerpoint extends StatelessWidget {
  final String txt;
  const Markerpoint({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 161, 61, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r))),
      child: Text(txt,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }
}
