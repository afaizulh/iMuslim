import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/detail/detail_dzikr_screen.dart';
import 'package:quran_app/model/dzikr_model.dart';
import 'package:quran_app/viewmodel/dzikr_viewmodel.dart';

class TabDzikr extends StatelessWidget {
  const TabDzikr({super.key});

  @override
  Widget build(BuildContext context) {
    final DzikrViewModel viewModel = DzikrViewModel();
    return FutureBuilder(
        future: viewModel.getListDzikrJudul(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context,
                  dzikrJudul: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList(
          {required BuildContext context, required DzikrJudul dzikrJudul}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailDzikrScreen.routeName,
              arguments: dzikrJudul.id.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svg/nomor_surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      dzikrJudul.nomor.toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: Colors.black),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dzikrJudul.judul.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    dzikrJudul.translate.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
}
