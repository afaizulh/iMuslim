import 'package:flutter/material.dart';
import 'package:quran_app/component/layout_navigation.dart';

class DasarScreen extends StatelessWidget {
  static const routeName = 'dasar_screen';
  const DasarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutNavigationBar(),
      
    );
  }
}