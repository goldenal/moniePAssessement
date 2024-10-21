import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchProvider with ChangeNotifier {
  late OverlayEntry overlayEntry;
  bool overlayOpened = false;
  double scalefactor = 0, overlayscale = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;
  GoogleMapController? mapController;
  String mapStyle = '';

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  loadJson() {
    // Load the dark theme JSON file
    rootBundle.loadString('assets/mapStyle/mapStyle.json').then((string) {
      mapStyle = string;
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
    Future.delayed(const Duration(milliseconds: 100), () {
      scalefactor = 1;
      notifyListeners();
    });
  }

  scaleOverlay(scale) {
    overlayscale = 1;
    notifyListeners();
  }
}
