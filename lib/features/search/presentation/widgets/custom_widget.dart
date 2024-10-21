import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidget extends StatelessWidget {
  final Color color;
  final double radius, paddingh, paddingv,h,w;
  final Widget widget;
  const CustomWidget(
      {super.key,
      required this.color,
      required this.radius,
      required this.widget,
      required this.paddingh,
      required this.paddingv,required this.h,required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      padding: EdgeInsets.symmetric(vertical:paddingv, horizontal: paddingh),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: Center(child: widget),
    );
  }
}
