import 'package:flutter/material.dart';
import 'package:flutter_google_maps/views/home_view.dart';

void main() {
  runApp(const FlutterGoogleMaps());
}

class FlutterGoogleMaps extends StatelessWidget {
  const FlutterGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
