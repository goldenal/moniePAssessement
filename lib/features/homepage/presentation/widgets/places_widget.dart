import 'package:assessment/features/homepage/presentation/widgets/glass_morph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlacesWidget extends StatelessWidget {
  final double height1, height2, fontsize;
  final String txt, img;
  BoxFit? fit;
  final bool isSmallBox;

  PlacesWidget(
      {super.key,
      required this.fontsize,
      required this.height1,
      required this.height2,
      required this.txt,
      this.fit,
      required this.img,
      required this.isSmallBox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: SizedBox(
        height: 170.h,
        width: 375.w,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.asset(
                  "assets/image/$img.jpg",
                  height: 500.h,
                  width: 375.w,
                  fit: fit ?? BoxFit.fill,
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: GlassmorphismCard(
                  height1: height1, //50
                  height2: height2, //42
                  fontSize: fontsize, //16
                  txt: txt, //"Gladkova St., 25",
                  isSmallBox: isSmallBox,
                ))
          ],
        ),
      ),
    );
  }
}
