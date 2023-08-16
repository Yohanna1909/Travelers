import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../home/home_controler.dart';
import '../location/location_service.dart';
import '../utils/widgets/appBar.global.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  final HomeController _homeController = HomeController(Permission.location);
  Set<Marker>_markers=Set<Marker>();
  
  @override
  void initState(){
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
  }
  void _setMarker(LatLng point){
    setState((){
      _markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position:point,
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomeController>(
      create:(_){
        const permission = Permission.location;
        final controller = HomeController(permission);
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
                      controller: _searchController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search here...',
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      var place =
                          await LocationService().getPlace(_searchController.text);
                      if (place != null) {
                        _goToPlace(place);
                      }
                    },
                    icon: Icon(Icons.search),
                    color: Color.fromARGB(255, 18, 118, 23),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer <HomeController>(
                builder: (_,controller,__)=>GoogleMap(
                  markers: controller.markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: controller.initialCameraPosition,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  onTap: controller.onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController mcontroller = await _controller.future;
    mcontroller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    _setMarker(LatLng(lat, lng));
  }
}

