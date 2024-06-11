import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/component/layout_navigation.dart';
import 'package:quran_app/dasar_screen.dart';
import 'package:quran_app/detail/detail_doa_screen.dart';
import 'package:quran_app/detail/detail_dzikr_screen.dart';
import 'package:quran_app/detail/detail_surah_screen.dart';
import 'package:quran_app/model/ayah_adapter.dart';
import 'package:quran_app/pages/bookmark_screen.dart';
import 'package:quran_app/pages/home_screen.dart';
import 'package:quran_app/pages/splash_screen.dart';

const String bookmarkBoxName = 'BOOKMARK';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AyahModelAdapter());
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(bookmarkBoxName);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        LayoutNavigationBar.routeName: (context) => const LayoutNavigationBar(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        DasarScreen.routeName: (context) => const DasarScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        BookmarkScreen.routeName: (context) =>
            const BookmarkScreen(), // Corrected this line
        DetailSurahScreen.routeName: (context) => DetailSurahScreen(
              id_surah: ModalRoute.of(context)?.settings.arguments as String,
            ),
        DetailDoaScreen.routeName: (context) => DetailDoaScreen(
              id_doa: ModalRoute.of(context)?.settings.arguments as String,
            ),
        DetailDzikrScreen.routeName: (context) => DetailDzikrScreen(
              id_dzikr: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
