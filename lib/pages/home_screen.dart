import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/component/tab_item.dart';
import 'package:quran_app/pages/tabs/doa_tab.dart';
import 'package:quran_app/pages/tabs/dzikr_tab.dart';
import 'package:quran_app/pages/tabs/surah_tab.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
}

AppBar _appBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svg/menu_icon.svg'),
      ),
      title: Text(
        "iMuslim",
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/search_icon.svg'))
      ],
    );

DefaultTabController _body() => DefaultTabController(
    length: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverToBoxAdapter(
            child: _salam(),
          ),
          SliverAppBar(
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: Border(
              bottom: BorderSide(width: 3, color: Colors.grey.withOpacity(0.1)),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: TabBar(
                  labelColor: primary,
                  indicatorColor: primary,
                  indicatorWeight: 3,
                  tabs: [
                    itemTab(label: "Surah"),
                    itemTab(label: "Dzikr"),
                    itemTab(label: "Doa"),
                  ]),
            ),
          ),
        ],
        body: const TabBarView(
          children: [
            TabSurah(),
            TabDzikr(),
            TabDoa(),
          ],
        ),
      ),
    ));

Column _salam() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Jajat',
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        Stack(children: [
          Container(
            height: 131,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 234, 182, 92), Color.fromARGB(255, 255, 140, 0)],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/book.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Last Read",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Al-Fatihah",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Ayat : 1",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ])
      ],
    );
