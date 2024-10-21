import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbox extends StatelessWidget {
  const Searchbox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Saint Petersburg",
          hintStyle:
              GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w600),
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.r))),
    );
  }
}
