import 'package:assessment/features/homepage/application/provider.dart';
import 'package:assessment/features/homepage/presentation/widgets/buy_stat.dart';
import 'package:assessment/features/homepage/presentation/widgets/dp_widget.dart';
import 'package:assessment/features/homepage/presentation/widgets/draggablesheet.dart';
import 'package:assessment/features/homepage/presentation/widgets/rent_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: const _Homepage(),
    );
  }
}

class _Homepage extends StatefulWidget {
  const _Homepage({super.key});

  @override
  State<_Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<_Homepage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Initialize the animation provider
    Provider.of<HomeScreenProvider>(context, listen: false).initialize(this);
    Provider.of<HomeScreenProvider>(context, listen: false).changeDpSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<HomeScreenProvider>(builder: (context, provider, child) {
      return SafeArea(
        child: Stack(
          children: [
            Container(
              width: 375.w,
              height: 812.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xfffdd1a8),
                ],
              )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                            curve: Curves.easeOut,
                            width: provider.locationWidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            duration: const Duration(milliseconds: 700),
                            child: AnimatedOpacity(
                              curve: Curves.easeOut,
                              opacity: provider.opacity,
                              duration: const Duration(milliseconds: 800),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 20.w,
                                      width: 20.w,
                                      child: SvgPicture.asset(
                                        "assets/svg/loc.svg",
                                        color: const Color.fromRGBO(
                                            163, 149, 129, 1),
                                      )),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "Saint Petersburg",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            163, 149, 129, 1)),
                                  ),
                                ],
                              ),
                            )),
                        DpWidget(
                          size: provider.dpSize,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AnimatedOpacity(
                      curve: Curves.easeOut,
                      opacity: provider.welcomTextOpacity,
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        "Hi Marina",
                        style: GoogleFonts.poppins(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(163, 149, 129, 1)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AnimatedPadding(
                      curve: Curves.easeOut,
                      padding: EdgeInsets.only(top: provider.padding),
                      duration: const Duration(milliseconds: 600),
                      child: Visibility(
                        visible: provider.isVisible,
                        child: Text(
                          "let's select your \nperfect place",
                          style: GoogleFonts.poppins(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedBuilder(
                              animation: provider.animationBuy,
                              builder: (context, child) {
                                return BuyStat(
                                  size: provider.buyRentScale,
                                  val:provider.formatNumber( provider.animationBuy.value),
                                );
                              }),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                              animation: provider.animationRent,
                              builder: (context, child) {
                                return RentStat(
                                  size: provider.buyRentScale,
                                  val: provider.formatNumber(
                                      provider.animationRent.value),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: provider.animation,
              builder: (BuildContext context, Widget? child) {
                return Visibility(
                  //  visible: provider.slidingsheetVisible,
                  child: Draggablesheet(
                    initialSize: provider.initialSize +
                        (provider.maxSize - provider.initialSize) *
                            provider.animation.value,
                    maxSize: provider.maxSize,
                    minSize: provider.minSize,
                  ),
                );
              },
            ),
          ],
        ),
      );
    }));
  }
}
