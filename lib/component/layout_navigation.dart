import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/pages/tabs/null_screen.dart';
import 'package:quran_app/pages/bookmark_screen.dart';
import 'package:quran_app/pages/home_screen.dart';
import 'package:quran_app/theme.dart';

class LayoutNavigationBar extends StatefulWidget {
  static const routeName = 'layout_navigation_bar';

  const LayoutNavigationBar({super.key});

  @override
  State<LayoutNavigationBar> createState() => _LayoutNavigationBarState();
}

class _LayoutNavigationBarState extends State<LayoutNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const NullScreen(),
    const BookmarkScreen(),
  ];

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onBarTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        unselectedItemColor: secondary,
        items: [
          _bottomNavigationBarItem(
              icon: 'assets/svg/quran_icon.svg', label: "Quran"),
          _bottomNavigationBarItem(icon: 'assets/svg/doa_icon.svg', label: "Doa"),
          _bottomNavigationBarItem(
              icon: 'assets/svg/bookmark_icon.svg', label: "Bookmark"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
      ),
      label: label,
    );
  }
}

