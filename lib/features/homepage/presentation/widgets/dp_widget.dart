import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DpWidget extends StatelessWidget {
  final double size;
  const DpWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(218, 150, 73, 1),
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 700),
      child: ClipOval(
        child: Image.asset(
          "assets/image/profile.png",
          height: 34.w,
          width: 34.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
