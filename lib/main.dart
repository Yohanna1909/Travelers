import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travelers/view/splash.view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaMapa(),
    );
  }
}

class PantallaMapa extends StatefulWidget {
  @override
  _PantallaMapaState createState() => _PantallaMapaState();
}

class _PantallaMapaState extends State<PantallaMapa> {
  //Firebase inicializar
  Future <FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp= await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder:(context, snapshot){
          if(snapshot.connectionState== ConnectionState.done){
            return SplashView();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
