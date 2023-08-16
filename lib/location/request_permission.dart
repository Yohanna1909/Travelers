
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelers/location/request_permission_controller.dart';
import 'package:travelers/view/homeScreen.view.dart';

class RequestPermission extends StatefulWidget {
  const RequestPermission({super.key});

  @override
  State<RequestPermission> createState() => _RequestPermissionState();
}

class _RequestPermissionState extends State<RequestPermission> {
  final _controller=RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _subscription=_controller.onStatusChanged.listen(
      (status) {
        if(status ==PermissionStatus.granted){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        }
      }
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width:double.infinity,
          height:double.infinity,
          alignment: Alignment.center,
          child:ElevatedButton(
            onPressed: (){
              _controller.request();
            },
            child: Text('Allow'))
        ),
      ),
    );
  }
}