import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchProvider with ChangeNotifier {
  late OverlayEntry overlayEntry;
  bool overlayOpened = false;
  double scalefactor = 0, overlayscale = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;
  late AnimationController _markercontroller;
  late Animation<double> _markeranimation;
  Animation<double> get markeranimation => _markeranimation;
  GoogleMapController? mapController;
  String mapStyle = '';
  double markerWidth = 85.w;

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );
    _markercontroller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _markeranimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _markercontroller, curve: Curves.easeInOut),
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
      _markercontroller.forward();
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
    _controller.forward();
  }

  Future<void> scalebackward() async {
    await _controller.reverse();
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
}
