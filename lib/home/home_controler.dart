import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/map_style.dart';

class HomeController extends ChangeNotifier {

  final Permission _locationPermission;

  final Map<MarkerId, Marker> _markers={};
  Set<Marker> get markers => _markers.values.toSet();
  final _markersController=StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  HomeController(this._locationPermission){
    _init();
  }

  final initialCameraPosition = const CameraPosition(
    target:LatLng(25.1193, 55.3773),
    zoom:15,
  );

  Future<void> _init() async{
    final isGranted =await _locationPermission.isGranted;
    
  }

  void onMapCreated(GoogleMapController controller){
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position){
    final id=_markers.length.toString();
    final markerId=MarkerId(_markers.length.toString());
    final marker= Marker(
      markerId: markerId,
      position: position,
      draggable:true,
      icon: BitmapDescriptor.defaultMarkerWithHue(135),
      onTap: (){
        _markersController.sink.add(id);
      },
      onDragEnd:(newPosition){
        print("new position $newPosition");
      }
    );
    _markers[markerId]=marker;
    notifyListeners();

  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}