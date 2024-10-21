import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Overlayoptions extends StatelessWidget {
  const Overlayoptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Items(
            txt: "Cosy Area",
            widget: SizedBox(
                child: Icon(
              Icons.verified_user,
              size: 20,
            )),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Items(
              txt: "Price",
              color: Color.fromRGBO(240, 161, 61, 1),
              widget: SizedBox(
                  child: Icon(
                size: 20,
                Icons.wallet_outlined,
                color: Color.fromRGBO(240, 161, 61, 1),
              ))),
          SizedBox(
            height: 10.h,
          ),
          const Items(
              txt: "Infrastructure",
              widget: SizedBox(child: Icon(size: 20, Icons.card_giftcard))),
          SizedBox(
            height: 10.h,
          ),
          const Items(
              txt: "Without any layer",
              widget: SizedBox(child: Icon(size: 20, Icons.layers))),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  final Widget widget;
  final Color? color;
  final String txt;
  const Items({super.key, required this.widget, required this.txt, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(child: widget),
        SizedBox(
          width: 5.w,
        ),
        Text(
          txt,
          style: GoogleFonts.poppins(
              color: color ?? Colors.black, fontSize: 10.sp),
        )
      ],
    );
  }
}
