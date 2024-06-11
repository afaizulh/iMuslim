import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quran_app/detail/detail_surah_screen.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/model/ayah_model.dart';

class BookmarkScreen extends StatelessWidget {
  static const routeName = 'bookmark_screen';
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box(bookmarkBoxName).listenable(),
        builder: (context, box, _) {
          final bookmarks = box.get('bookmark', defaultValue: []);
          if (bookmarks.isNotEmpty) {
            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final Ayat? ayat = bookmarks[index] != null
                    ? Ayat.fromJson(bookmarks[index])
                    : null;

                return ListTile(
                  title: Text('${ayat?.nomor}: ${ayat?.ar}'),
                  onTap: () {
                    // Navigator.pushNamed(context, DetailSurahScreen.routeName, arguments: ayat);
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('No bookmarks yet!'),
            );
          }
        },
      ),
    );
  }
}
