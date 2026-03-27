import 'package:flutter/material.dart';
import 'package:flutter_google_maps/widgets/custom_google_map.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomGoogleMap());
  }
}
