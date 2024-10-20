import 'package:assessment/features/homepage/presentation/widgets/places_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Draggablesheet extends StatelessWidget {
 final double initialSize, maxSize, minSize;
  const Draggablesheet({super.key,required this.initialSize,required this.maxSize,required this.minSize});

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
                      child: PlacesWidget(
                        fontsize: 16.sp,
                        height1: 50.h,
                        height2: 42.w,
                        txt: "Gladkova St., 25",
                        isSmallBox: false,
                        img: "pic1",
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 2,
                      child: PlacesWidget(
                          fontsize: 12.sp,
                          height1: 47.h,
                          height2: 40.w,
                          isSmallBox: true,
                          fit: BoxFit.fitHeight,
                          img: "pic2",
                          txt: "Gladkova St., 25"),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: PlacesWidget(
                          fontsize: 12.sp,
                          height1: 47.h,
                          height2: 40.w,
                          img: "pic3",
                          isSmallBox: true,
                          txt: "Gladkova St., 25"),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: PlacesWidget(
                          fontsize: 12.sp,
                          img: "pic1",
                          height1: 47.h,
                          height2: 40.w,
                          isSmallBox: true,
                          txt: "Gladkova St., 25"),
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
   