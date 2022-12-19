import 'dart:convert';

class Place {
  String descripcion;
  String nombre;
  String? id;
  Place({required this.descripcion, required this.nombre, this.id});

  factory Place.fromJson(String str) => Place.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        descripcion: json["descripcion"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "nombre": nombre,
      };
  Place copyWith() => Place(
        descripcion: descripcion,
        nombre: nombre,
        id: id,
      );
}
