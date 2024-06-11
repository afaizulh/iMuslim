class DzikrGeneral {
  String? id;
  String? nomor;
  String? judul;
  String? translate;
  List<Dzikr>? dzikr;

  DzikrGeneral({this.id, this.nomor, this.judul, this.translate, this.dzikr});

  DzikrGeneral.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    judul = json['judul'];
    translate = json['translate'];
    if (json['dzikr'] != null) {
      dzikr = <Dzikr>[];
      json['dzikr'].forEach((v) {
        dzikr!.add(Dzikr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nomor'] = nomor;
    data['judul'] = judul;
    data['translate'] = translate;
    if (dzikr != null) {
      data['dzikr'] = dzikr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dzikr {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? notes;
  String? fawaid;
  String? source;

  Dzikr(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  Dzikr.fromJson(Map<String, dynamic> json) {
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
