import 'package:flutter/material.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key, required this.doa});
  final Doa doa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            Txt(
              text: doa.judul,
              size: 25,
              weight: FontWeight.bold,
              color: AppColor.bgApp,
            ),
            const SizedBox(height: 30.0),
            Cntr(
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.centerRight,
              child: Txt(text: doa.arab, size: 40, weight: FontWeight.w600),
            ),
            const SizedBox(height: 20.0),
            Txt(text: doa.indo),
          ],
        ),
      ),
    );
  }
}
