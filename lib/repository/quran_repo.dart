import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/model/doa_general_model.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/model/dzikr_general_model.dart';
import 'package:quran_app/model/dzikr_model.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<Surah>> getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');

    return surahFromJson(data);
  }

  Future<AyahModel> getAyahList(String idSurah) async {
    String url = 'https://equran.id/api/surat/$idSurah';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('JSON Data: $json');
      return AyahModel.fromJson(body);
    }
    throw Exception("error");
  }

  Future<List<DzikrJudul>> getDzikrJudulList() async {
    String data = await rootBundle.loadString('assets/data/list-dzikr.json');

    return dzikrFromJson(data);
  }

  Future<DzikrGeneral> getDzikrList(String idDzikr) async {
    String data =
        await rootBundle.loadString('assets/data/list-dzikr-general.json');

    final List<dynamic> decodedData = jsonDecode(data);

    // Mencari data spesifik berdasarkan id_doa
    Map<String, dynamic>? specificData = decodedData
        .firstWhere((element) => element['id'] == idDzikr, orElse: () => null);

    if (specificData != null) {
      return DzikrGeneral.fromJson(specificData);
    } else {
      throw Exception('Dzikr dengan ID $idDzikr tidak ditemukan');
    }
  }

  Future<List<DoaJudul>> getDoaJudulList() async {
    String data = await rootBundle.loadString('assets/data/list-doa.json');

    return doaFromJson(data);
  }

  Future<DoaGeneral> getDoaList(String idDoa) async {
    String data =
        await rootBundle.loadString('assets/data/list-doa-general.json');

    final List<dynamic> decodedData = jsonDecode(data);

    // Mencari data spesifik berdasarkan id_doa
    Map<String, dynamic>? specificData = decodedData
        .firstWhere((element) => element['id'] == idDoa, orElse: () => null);

    if (specificData != null) {
      return DoaGeneral.fromJson(specificData);
    } else {
      throw Exception('Doa dengan ID $idDoa tidak ditemukan');
    }
  }
}
