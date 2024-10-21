import 'package:assessment/features/homepage/presentation/widgets/places_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Draggablesheet extends StatelessWidget {
  final double initialSize, maxSize, minSize, scale, wigdet1Size, wigdet2size, wigdet3Size,wigdet1Opacity,wigdet2Opacity,wigdet3Opacity;
  const Draggablesheet(
      {super.key,
      required this.initialSize,
      required this.maxSize,
      required this.minSize,
      required this.wigdet1Size,
      required this.wigdet2size,
      required this.wigdet3Size,
      required this.wigdet1Opacity,
      required this.wigdet2Opacity,required this.wigdet3Opacity,
      required this.scale});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: maxSize,
        minChildSize: minSize,
        initialChildSize: initialSize,
        expand: true,
        builder: (BuildContext context, scrollController) {
          return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 150.w),
                        child: PlacesWidget(
                          fontsize: 16.sp,
                          height1: 50.h,
                          height2: 42.w,
                          opacity: wigdet1Opacity,
                          width: wigdet1Size,
                          scale: scale,
                          duration: 1000,
                          txt: "Gladkova St., 25",
                          isSmallBox: false,
                          img: "pic1",
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 2,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 150.w),
                        child: PlacesWidget(
                            fontsize: 12.sp,
                            height1: 47.h,
                            height2: 40.w,
                            opacity: wigdet3Opacity,
                            width: wigdet3Size,
                            duration: 1000,
                            scale: scale,
                            isSmallBox: true,
                            fit: BoxFit.fitHeight,
                            img: "pic2",
                            txt: "Gladkova St., 25"),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 150.w),
                        child: PlacesWidget(
                            fontsize: 12.sp,
                            height1: 47.h,
                            width: wigdet2size,
                            opacity: wigdet2Opacity,
                            duration: 600,
                            height2: 40.w,
                            scale: scale,
                            img: "pic3",
                            isSmallBox: true,
                            txt: "Gladkova St., 25"),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 150.w),
                        child: PlacesWidget(
                            fontsize: 12.sp,
                            img: "pic1",
                            height1: 47.h,
                            height2: 40.w,
                            width:wigdet3Size,
                            opacity: wigdet3Opacity,
                            scale: scale,
                            duration: 1000,
                            isSmallBox: true,
                            txt: "Gladkova St., 25"),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

//    SingleChildScrollView(
//             child: StaggeredGrid.count(
//               crossAxisCount: 2,
//               mainAxisSpacing: 3,
//               crossAxisSpacing: 2,
//               children: const [
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 2,
//                   mainAxisCellCount: 1,
//                   child: PlacesWidget(),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 2,
//                   child: PlacesWidget(),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: PlacesWidget(),
//                 ),
//                 StaggeredGridTile.count(
//                   crossAxisCellCount: 1,
//                   mainAxisCellCount: 1,
//                   child: PlacesWidget(),
//                 ),
//               ],
//             ),
//           ));
   