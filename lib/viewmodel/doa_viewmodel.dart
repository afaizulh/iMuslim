import 'package:quran_app/model/doa_general_model.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class DoaViewModel {
  final QuranRepository _repsitory = QuranRepository();

  Future<List<DoaJudul>> getListDoaJudul() async =>
      await _repsitory.getDoaJudulList();
}

class DoaGeneralViewModel {
  final _repository = QuranRepository();

  Future<DoaGeneral> getListDoa(String idDoa) async => await _repository.getDoaList(idDoa);
}
