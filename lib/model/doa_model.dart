import 'dart:convert';

List<DoaJudul> doaFromJson(String str) =>
    List<DoaJudul>.from(json.decode(str).map((x) => DoaJudul.fromJson(x)));

class DoaJudul {
  int id;
  int nomor;
  String judul;
  String translate;

  DoaJudul({
    required this.id,
    required this.nomor,
    required this.judul,
    required this.translate,
  });

  factory DoaJudul.fromJson(Map<String, dynamic> json) => DoaJudul(
      id: json['id'],
      nomor: json['nomor'],
      judul: json['judul'],
      translate: json['translate']);
}
