import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/dzikr_general_model.dart';
import 'package:quran_app/viewmodel/dzikr_viewmodel.dart';

class DetailDzikrScreen extends StatelessWidget {
  static const routeName = 'detail_dzikr_screen';
  final String id_dzikr;
  const DetailDzikrScreen({super.key, required this.id_dzikr});

  @override
  Widget build(BuildContext context) {
    final DzikrGeneralViewModel viewModel = DzikrGeneralViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: viewModel.getListDzikr(id_dzikr),
          builder: (context, AsyncSnapshot<DzikrGeneral> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) => _dzikrItemList(
                      context: context,
                      dzikr: snapshot.data!.dzikr!.elementAt(index)),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                  itemCount: snapshot.data!.dzikr!.length);
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }),
    );
  }

  Widget _dzikrItemList(
          {required BuildContext context, required Dzikr dzikr}) =>
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
                        dzikr.title.toString(),
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
            Text(
              dzikr.arabic.toString(),
              textAlign: TextAlign.end,
              style: GoogleFonts.amiriQuran(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dzikr.latin.toString(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.amiriQuran(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(dzikr.translation.toString(),
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
