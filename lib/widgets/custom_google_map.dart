import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.949968, 35.836337), // x,y
      zoom: 15,
    );
    loadMapStyle(); // new way to change map style
  }

  // old way to change map style
  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/night_map_style.json');
    googleMapController.setMapStyle(nightMapStyle);
  }

  // new way to change map style
  void loadMapStyle() async {
    final style = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/night_map_style.json');

    if (mounted) {
      setState(() {
        _mapStyle = style;
      });
    }
  }

  void updateCameraPosition({required CameraPosition cameraPosition}) {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
  //zoom range:
  // ward zoom view:0 -> 3
  // country zoom view:4 -> 6
  // city zoom view:10 -> 12
  // street zoom view:13 -> 17
  // building zoom view:18 -> 20

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (controller) {
            googleMapController = controller;
            // initMapStyle(); old way to change map style
          },
          mapType: MapType.normal,
          style: _mapStyle,
          // cameraTargetBounds: CameraTargetBounds(
          //   LatLngBounds(
          //     southwest: LatLng(31.949968, 35.836337),
          //     northeast: LatLng(31.949968, 35.836337),
          //   ),
          // ),
        ),
        Positioned(
          bottom: 20,
          right: 16,
          left: 16,
          child: ElevatedButton(
            onPressed: () {
              updateCameraPosition(
                cameraPosition: CameraPosition(
                  target: LatLng(31.945136767796665, 35.84988008430412),
                  zoom: 15,
                ),
              );
              setState(() {});
            },
            child: Text('Change Location'),
          ),
        ),
      ],
    );
  }
}
