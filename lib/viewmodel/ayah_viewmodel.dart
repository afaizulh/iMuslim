import 'package:hive/hive.dart';
import 'package:quran_app/detail/detail_surah_screen.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

void addToBookmark(Ayat ayat) async {
  final box = Hive.box(bookmarkBoxName);
  box.add(ayat.toJson());
}

class AyahViewModel {
  final _repository = QuranRepository();

  Future<AyahModel> getListAyah(String idSurah) async {
    try {
      final response = await _repository.getAyahList(idSurah);
      return response;
    } catch (e) {
      print("Error : $e");
      rethrow;
    }
  }
}
