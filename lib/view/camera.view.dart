
import '../home/models.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<Lugares> lugares = [];
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();
  String? foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Lugares'),
      ),
      body: PageView(
        children: [
          _buildAgregarLugarPage(),
          _buildListaLugaresPage(),
        ],
      ),
    );
  }

  Widget _buildAgregarLugarPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: tituloController,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          ElevatedButton(
            child: Text('Tomar Foto'),
            onPressed: () async {
              final file = await _tomarFoto();
              if (file != null) {
                foto = file.path;
              }
            },
          ),
          TextField(
            controller: descripcionController,
            decoration: InputDecoration(labelText: 'Descripción'),
          ),
          ElevatedButton(
            child: Text('Guardar'),
            onPressed: () {
              final lugar = Lugares(
                titulo: tituloController.text,
                descripcion: descripcionController.text,
                foto: foto != null ? File(foto!) : null,
              );
              setState(() {
                lugares.add(lugar);
              });
              tituloController.clear();
              descripcionController.clear();
              foto = null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListaLugaresPage() {
    return ListView.builder(
      itemCount: lugares.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(lugares[index].titulo),
          onTap: () {
            _mostrarDetalleLugar(lugares[index]);
          },
        );
      },
    );
  }

  Future<File?> _tomarFoto() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    }
    return null;
  }

  void _mostrarDetalleLugar(Lugares lugar) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleLugarScreen(lugar: lugar),
      ),
    );
  }
}

class DetalleLugarScreen extends StatelessWidget {
  final Lugares lugar;

  DetalleLugarScreen({required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.titulo),
      ),
      body: Column(
        children: [
          if (lugar.foto != null) Image.file(lugar.foto!),
          Text('Descripción: ${lugar.descripcion}'),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Camera()));
