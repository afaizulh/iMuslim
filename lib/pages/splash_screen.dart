import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/dasar_screen.dart';
import 'package:quran_app/theme.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "iMuslim",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Learn Quran and\nRecite once everyday",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: secondary, fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset('assets/svg/splash.svg'),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: -20,
                    child: Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          Navigator.pushNamed(context, DasarScreen.routeName);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
