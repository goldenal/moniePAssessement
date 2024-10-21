import 'package:assessment/features/search/application/search_provider.dart';
import 'package:assessment/features/search/presentation/widgets/overlay_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void showOverlay(BuildContext context) {
  var myprovider = Provider.of<SearchProvider>(context, listen: false);
  myprovider.overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 150.h,
      left: 25.w,
      child: ScaleTransition(
        scale: myprovider.animation,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.r), // Set border radius directly
          ),
          child: GestureDetector(
              onTap: () {
                removeOverlay(context);
              },
              child: Overlayoptions()),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(myprovider.overlayEntry);
  myprovider.scaleForward();
  myprovider.overlayOpened = true;
}

removeOverlay(BuildContext context) {
  var myprovider = Provider.of<SearchProvider>(context, listen: false);
  myprovider.scalebackward().then((_) {
    myprovider.overlayEntry.remove();
    myprovider.overlayOpened = false;
  });
}
