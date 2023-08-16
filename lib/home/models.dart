import 'dart:io';
class Lugares {
  final String titulo;
  final String descripcion;
  final File? foto;

  Lugares({
    required this.titulo,
    required this.descripcion,
    this.foto,
  });
}