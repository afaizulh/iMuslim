import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/model/ayah_adapter.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/viewmodel/ayah_viewmodel.dart';
import 'package:path_provider/path_provider.dart';

class DetailSurahScreen extends StatelessWidget {
  static const routeName = 'detail_surah_screen';
  final String id_surah;
  const DetailSurahScreen({Key? key, required this.id_surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AyahViewModel viewModel = AyahViewModel();
    final AudioPlayer _player = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        actions: [
          FutureBuilder(
              future: viewModel.getListAyah(id_surah),
              builder: (context, snapshot) {
                return IconButton(
                    onPressed: () async {
                      await _player.setAudioSource(AudioSource.uri(
                          Uri.parse(snapshot.data!.audio.toString())));
                    },
                    icon: Icon((Icons.play_arrow)));
              }),
          FutureBuilder(
              future: viewModel.getListAyah(id_surah),
              builder: (context, snapshot) {
                return IconButton(
                    onPressed: () async {
                      await _player.pause();
                    },
                    icon: Icon(Icons.pause));
              })
        ],
        title: FutureBuilder(
          future: viewModel.getListAyah(id_surah),
          builder: (context, AsyncSnapshot<AyahModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading..."),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Text(snapshot.data!.namaLatin.toString());
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          },
        ),
      ),
      body: FutureBuilder(
          future: viewModel.getListAyah(id_surah),
          builder: (context, AsyncSnapshot<AyahModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => _ayahItemList(
                      context: context,
                      ayat: snapshot.data!.ayat!.elementAt(index)),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                  itemCount: snapshot.data!.ayat!.length);
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }),
    );
  }

  Widget _ayahItemList({required BuildContext context, required Ayat ayat}) =>
      Container(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("Add to Bookmark"),
                  content:
                      Text("Do you want to add this ayah to your bookmarks?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        final box = Hive.box(bookmarkBoxName);
                        final List<dynamic>? rawBookmarks =
                            box.get('bookmarks', defaultValue: []);
                        final List<Map<dynamic, dynamic>> bookmarks =
                            rawBookmarks?.cast<Map<dynamic, dynamic>>() ?? [];

                        bookmarks.add(ayat.toJson());
                        box.put('bookmarks', bookmarks);
                        Navigator.of(context).pop();
                      },
                      child: Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                  ],
                );
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset('assets/svg/nomor_surah.svg'),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Center(
                          child: Text(
                            ayat.nomor.toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ayat.ar.toString(),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.amiriQuran(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ayat.tr.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ayat.idn.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
}
