import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doa_general_model.dart';
import 'package:quran_app/viewmodel/doa_viewmodel.dart';

class DetailDoaScreen extends StatelessWidget {
  static const routeName = 'detail_doa_screen';
  final String id_doa;
  const DetailDoaScreen({super.key, required this.id_doa});

  @override
  Widget build(BuildContext context) {
    final DoaGeneralViewModel viewModel = DoaGeneralViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: viewModel.getListDoa(id_doa),
          builder: (context, AsyncSnapshot<DoaGeneral> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => _doaItemList(
                      context: context,
                      doa: snapshot.data!.doa!.elementAt(index)),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                  itemCount: snapshot.data!.doa!.length);
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }),
    );
  }

  Widget _doaItemList({required BuildContext context, required Doa doa}) =>
      Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doa.title.toString(),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(doa.arabic.toString(),
                textAlign: TextAlign.end,
                style: GoogleFonts.amiriQuran(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doa.latin.toString(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.amiriQuran(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(doa.translation.toString(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.amiriQuran(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
