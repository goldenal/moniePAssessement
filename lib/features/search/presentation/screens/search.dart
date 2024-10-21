import 'package:assessment/features/navbar/presentation/widget/navbar.dart';
import 'package:assessment/features/search/application/search_provider.dart';
import 'package:assessment/features/search/presentation/widgets/custom_widget.dart';
import 'package:assessment/features/search/presentation/widgets/marker.dart';
import 'package:assessment/features/search/presentation/widgets/overlay.dart';
import 'package:assessment/features/search/presentation/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    var myprovider = Provider.of<SearchProvider>(context, listen: false);
    myprovider.scaleWidgets();
    myprovider.initialize(this);
    myprovider.loadJson();
    myprovider.scaleMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchProvider>(builder: (context, provider, child) {
        return Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            GoogleMap(
              onMapCreated: provider.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(23.0225, 72.5714),
                zoom: 12,
              ),
              mapType: MapType.normal,
            ),

            Positioned(
              left: 25.w,
              bottom: 150.h,
              child: AnimatedScale(
                scale: provider.scalefactor,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    showOverlay(context);
                  },
                  child: CustomWidget(
                    color: Colors.white.withOpacity(0.3),
                    paddingh: 15.w,
                    paddingv: 10.h,
                    w: 50.w,
                    h: 50.w,
                    radius: 30.r,
                    widget: const SizedBox(
                        child: Icon(
                      Icons.layers,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 25.w,
              bottom: 90.h,
              child: AnimatedScale(
                scale: provider.scalefactor,
                duration: const Duration(milliseconds: 500),
                child: CustomWidget(
                  color: Colors.white.withOpacity(0.3),
                  paddingh: 15.w,
                  paddingv: 10.h,
                  w: 50.w,
                  h: 50.w,
                  radius: 30.r,
                  widget: const SizedBox(
                      child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  )),
                ),
              ),
            ),

            Positioned(
              right: 25.w,
              left: 25.w,
              top: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedScale(
                      scale: provider.scalefactor,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(width: 250.w, child: const Searchbox())),
                  AnimatedScale(
                    scale: provider.scalefactor,
                    duration: const Duration(milliseconds: 500),
                    child: CustomWidget(
                      color: Colors.white,
                      paddingh: 15.w,
                      paddingv: 10.h,
                      w: 50.w,
                      h: 50.w,
                      radius: 30.r,
                      widget: const SizedBox(
                          child: Icon(
                        Icons.tune,
                        color: Colors.black,
                      )),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 25.w,
              bottom: 90.h,
              child: AnimatedScale(
                scale: provider.scalefactor,
                duration: const Duration(milliseconds: 500),
                child: CustomWidget(
                    color: Colors.white.withOpacity(0.3),
                    paddingh: 15.w,
                    paddingv: 10.h,
                    w: 150.w,
                    h: 50.w,
                    radius: 30.r,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        Text(
                          "List of variants",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
              ),
            ),

            Positioned(
              top: 400.h,
              left: 80.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "4,3mn P",
                      )),
                    );
                  }),
            ),
            Positioned(
              top: 450.h,
              left: 228.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "11,3mn P",
                      )),
                    );
                  }),
            ),
            Positioned(
              top: 350.h,
              left: 258.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "13,3mn P",
                      )),
                    );
                  }),
            ),
            Positioned(
              top: 250.h,
              left: 258.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "17,3mn P",
                      )),
                    );
                  }),
            ),
            Positioned(
              top: 210.h,
              left: 98.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "16,3mn P",
                      )),
                    );
                  }),
            ),
            Positioned(
              top: 160.h,
              left: 78.w,
              child: AnimatedBuilder(
                  animation: provider.markeranimation,
                  builder: (context, child) {
                    return Transform.scale(
                      alignment: Alignment.bottomLeft,
                      scale: provider.markeranimation.value,
                      child: Center(
                          child: Markerpoint(
                        w: provider.markerWidth,
                        txt: "10,3mn P",
                      )),
                    );
                  }),
            ),

            //,
            Positioned(
                bottom: 10.h,
                right: 58.w,
                left: 58.w,
                //
                child: Navbar())
          ],
        );
      }),
    );
  }
}
