class DoaGeneral {
  String? id;
  String? nomor;
  String? judul;
  String? translate;
  List<Doa>? doa;

  DoaGeneral({this.id, this.nomor, this.judul, this.translate, this.doa});

  DoaGeneral.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    judul = json['judul'];
    translate = json['translate'];
    if (json['doa'] != null) {
      doa = <Doa>[];
      json['doa'].forEach((v) {
        doa!.add(Doa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nomor'] = nomor;
    data['judul'] = judul;
    data['translate'] = translate;
    if (doa != null) {
      data['doa'] = doa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doa {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  dynamic notes;
  String? fawaid;
  String? source;

  Doa(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  Doa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    notes = json['notes'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['arabic'] = arabic;
    data['latin'] = latin;
    data['translation'] = translation;
    data['notes'] = notes;
    data['fawaid'] = fawaid;
    data['source'] = source;
    return data;
  }
}
