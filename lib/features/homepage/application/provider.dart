import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Animation state provider
class HomeScreenProvider with ChangeNotifier {
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
      slidingsheetVisible = true;
      _controller.forward();
    });
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

  changeDpSize() {
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
