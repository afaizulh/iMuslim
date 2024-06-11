import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/detail/detail_doa_screen.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/viewmodel/doa_viewmodel.dart';

class TabDoa extends StatelessWidget {
  const TabDoa({super.key});

  @override
  Widget build(BuildContext context) {
    final DoaViewModel viewModel = DoaViewModel();
    return FutureBuilder(
      future: viewModel.getListDoaJudul(), 
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, doaJudul: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
      }
    );
  }

  Widget _itemList({required BuildContext context, required DoaJudul doaJudul}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailDoaScreen.routeName, arguments: doaJudul.id.toString());
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
                      doaJudul.nomor.toString(),
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
                    doaJudul.judul.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    doaJudul.translate.toString(),
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