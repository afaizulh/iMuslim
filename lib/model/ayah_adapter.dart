import 'package:hive/hive.dart';
import 'package:quran_app/model/ayah_model.dart';

class AyahModelAdapter extends TypeAdapter<AyahModel> {
  @override
  final typeId = 0;

  @override
  AyahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = Map<String, dynamic>.fromIterable(
      Iterable<int>.generate(numOfFields),
      value: (i) => reader.read(),
    );
    return AyahModel(
      nomor: fields['nomor'] as int?,
      nama: fields['nama'] as String?,
      namaLatin: fields['nama_latin'] as String?,
      jumlahAyat: fields['jumlah_ayat'] as int?,
      tempatTurun: fields['tempat_turun'] as String?,
      arti: fields['arti'] as String?,
      deskripsi: fields['deskripsi'] as String?,
      audio: fields['audio'] as String?,
      status: fields['status'] as dynamic,
      ayat: fields['ayat'] == null
          ? null
          : List<Ayat>.from(
              fields['ayat']!.map((item) => Ayat.fromJson(item))),
      suratSelanjutnya: fields['surat_selanjutnya'] == null
          ? null
          : SuratSelanjutnya.fromJson(fields['surat_selanjutnya']),
      suratSebelumnya: fields['surat_sebelumnya'] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AyahModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.nomor)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.namaLatin)
      ..writeByte(3)
      ..write(obj.jumlahAyat)
      ..writeByte(4)
      ..write(obj.tempatTurun)
      ..writeByte(5)
      ..write(obj.arti)
      ..writeByte(6)
      ..write(obj.deskripsi)
      ..writeByte(7)
      ..write(obj.audio)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.ayat == null ? null : obj.ayat!.length)
      ..writeByte(10);
    if (obj.ayat != null) {
      obj.ayat!.forEach((ayat) {
        writer.writeByte(11);
        writer.write(ayat.toJson());
      });
    }
    if (obj.suratSelanjutnya != null) {
      writer.writeByte(12);
      writer.write(obj.suratSelanjutnya!.toJson());
    }
    writer
      ..writeByte(13)
      ..write(obj.suratSebelumnya);
  }
}