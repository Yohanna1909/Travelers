
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../home/home_controler.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <HomeController>(
      create:(_){
        final controller = HomeController();
        controller.onMarkerTap.listen((String id) { 
          print("got to $id");
        });
        return controller;
      },
      child: Scaffold(
        body: Consumer <HomeController>(
          builder: (_,controller,__)=>GoogleMap(
            markers: controller.markers,
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            onTap: controller.onTap,
          ),
        )
      )
    );
  }
}