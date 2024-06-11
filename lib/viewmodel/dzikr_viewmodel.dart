import 'package:quran_app/model/dzikr_general_model.dart';
import 'package:quran_app/model/dzikr_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class DzikrViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<DzikrJudul>> getListDzikrJudul() async => await _repository.getDzikrJudulList();
}

class DzikrGeneralViewModel {
  final _repository = QuranRepository();

  Future<DzikrGeneral> getListDzikr(String idDzikr) async => await _repository.getDzikrList(idDzikr);
}
