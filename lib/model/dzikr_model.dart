import 'dart:convert';

List<DzikrJudul> dzikrFromJson(String str) =>
    List<DzikrJudul>.from(json.decode(str).map((x) => DzikrJudul.fromJson(x)));

class DzikrJudul {
  int id;
  int nomor;
  String judul;
  String translate;

  DzikrJudul({
    required this.id,
    required this.nomor,
    required this.judul,
    required this.translate,
  });

  factory DzikrJudul.fromJson(Map<String, dynamic> json) => DzikrJudul(
      id: json['id'],
      nomor: json['nomor'],
      judul: json['judul'],
      translate: json['translate']);
}
