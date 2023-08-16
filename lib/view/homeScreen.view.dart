import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:travelers/location/location_service.dart';

import '../home/home_controler.dart';
import '../utils/widgets/appBar.global.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _controller= Completer();
  
  @override
  Widget build(BuildContext context) {
    const permission = Permission.location;
    final controller = HomeController(permission);

    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        controller.onMarkerTap.listen((String id) {
          print("got to $id");
        });
        return controller;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: HomeAppBar(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller:_searchController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search here...',
                      ),
                      onChanged: (value){
                        print(value);
                      },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: ()async{
                      var place= await LocationService().getPlace(_searchController.text);
                      _goToPlace(place);
                    },
                    icon: Icon(Icons.search),
                    color: Color.fromARGB(255, 18, 118, 23),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GoogleMap(
                markers: controller.markers,
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
                initialCameraPosition: controller.initialCameraPosition,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                onTap: controller.onTap,
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  Future<void> _goToPlace(Map<String,dynamic> place)async{
    final double lat=place['geometry']['location']['lat'];
    final double lng=place['geometry']['location']['lng'];

    final GoogleMapController mcontroller=await _controller.future;
    mcontroller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng),zoom:12),
      )
    );
  }
}
