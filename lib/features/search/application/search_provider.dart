import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchProvider with ChangeNotifier {
  late OverlayEntry overlayEntry;
  bool overlayOpened = false;
  double scalefactor = 0, overlayscale = 0;
  late AnimationController controller;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;
  late AnimationController markercontroller;
  late Animation<double> _markeranimation;
  Animation<double> get markeranimation => _markeranimation;
  GoogleMapController? mapController;
  String mapStyle = '';
  double markerWidth = 85.w;

  void initialize(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );
    markercontroller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    _markeranimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: markercontroller, curve: Curves.easeInOut),
    );
  }

  loadJson() {
    // Load the dark theme JSON file
    rootBundle.loadString('assets/mapStyle/mapStyle.json').then((string) {
      mapStyle = string;
    });
  }

  scaleMarkers() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      markercontroller.forward();
    });
    Future.delayed(const Duration(milliseconds: 6000), () {
      markerWidth = 40.w;
      notifyListeners();
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    mapController!.setMapStyle(mapStyle);
  }

  scaleForward() {
    controller.forward();
  }

  Future<void> scalebackward() async {
    await controller.reverse();
  }

  scaleWidgets() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      scalefactor = 1;
      notifyListeners();
    });
  }

  scaleOverlay(scale) {
    overlayscale = 1;
    notifyListeners();
  }

  @override
  void dispose() {
    // controller.dispose();
    // markercontroller.dispose();
    // _controller.dispose();
    super.dispose();
  }
}
