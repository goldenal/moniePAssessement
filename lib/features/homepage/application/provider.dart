import 'dart:developer';

import 'package:assessment/features/homepage/presentation/screens/homepage.dart';
import 'package:assessment/features/search/presentation/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

// Animation state provider
class HomeScreenProvider with ChangeNotifier {
  double navpostion = -70.h;
  bool ran = false;
  int navbarIndex = 3;
  Widget selectedPage = const Homepage();

  double scalePolymorphcard = 0, polyslideSize = 42.w;
  double polyslideWig1 = 42.w,
      polyslideWig2 = 42.w,
      polyslide3 = 42.w,
      opaq1 = 0,
      opaq2 = 0,
      opaq3 = 0;

  double sheetOpaque = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  double initialSize = 0.1; // Initial child size of the sheet
  final double maxSize = 0.75; // Max size of the sheet
  final double minSize = 0.1; // Max size of the sheet
  double dpSize = 0, buyRentScale = 0;
  double opacity = 0, welcomTextOpacity = 0, padding = 40.h;
  double locationWidth = 0;
  bool isVisible = false, slidingsheetVisible = false;
  late AnimationController _controllerBuyandRent;
  late Animation<int> _animationRent;
  late Animation<int> _animationBuy;

  Animation<int> get animationRent => _animationRent;
  Animation<int> get animationBuy => _animationBuy;

  Animation<double> get animation => _animation;

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: vsync,
    );

    _controllerBuyandRent = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuint,
    );
    _animationRent =
        IntTween(begin: 1, end: 2166).animate(_controllerBuyandRent);
    _animationBuy =
        IntTween(begin: 1, end: 1034).animate(_controllerBuyandRent);

    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 2000), () {
      polyslideWig1 = 42.w;
      polyslideWig2 = 42.w;
      polyslide3 = 42.w;

      navpostion = -70.h;

      sheetOpaque = 1;
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 500), () {
        scalePolymorphcard = 1; //scale animation
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 200), () {
          polyslideWig1 = 360.w; //increase the width
          notifyListeners();
          Future.delayed(const Duration(milliseconds: 250), () {
            opaq1 = 1;
            polyslideWig2 = 360.w;

            polyslide3 = 360.w; //animating last set
            notifyListeners();

            Future.delayed(const Duration(milliseconds: 50), () {
              opaq2 = 1;
              opaq3 = 1;
              notifyListeners();
              Future.delayed(const Duration(milliseconds: 400), () {
                navpostion = 10.h;
                notifyListeners();
              });
            });
          });
        });
      });
    });
  }

  getPage(indx) {
    if (indx == 3) {
      selectedPage = const Homepage();
    } else {
      selectedPage = const Search();
    }
  }

  void requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
       Future.delayed(const Duration(milliseconds: 4000), () async{
                await Permission.location.request();
              });
     
    }
  }

  String formatNumber(int number) {
    if (number >= 1000) {
      String numberStr = number.toString();
      int length = numberStr.length;
      return '${numberStr.substring(0, length - 3)} ${numberStr.substring(length - 3)}';
    } else {
      return number.toString();
    }
  }

  startSomeAnimation() {
    Future.delayed(Duration.zero, () {
      dpSize = 0;
      opacity = 0;
      buyRentScale = 0;

      padding = 40.h;
      isVisible = false;
      welcomTextOpacity = 0;
      locationWidth = 0;
      locationWidth = 160.w;
      dpSize = 30.w;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 800), () {
        opacity = 1;
        notifyListeners();
      }).then((val) {
        welcomTextOpacity = 1;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 150), () {
          isVisible = true;
          padding = 0;
          notifyListeners();
          Future.delayed(const Duration(milliseconds: 100), () {
            _controllerBuyandRent.forward();
            buyRentScale = 1;

            notifyListeners();
          });
        });
      });
    });
    ran = true;
  }

  updateNavBarIndex(int index) {
    navbarIndex = index;
    log(index.toString());
    getPage(index);

    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
