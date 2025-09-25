import 'package:flutter/material.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class JadwalSolatPage extends StatelessWidget {
  const JadwalSolatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgAppBlack,
      body: Stack(
        children: [
          Image.asset(AppImagesUrl.backround),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          text: 'Jadwal Sholat',
                          size: 20,
                          weight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                        const SizedBox(height: 5.0),
                        Txt(
                          text: 'Jakarta',
                          size: 20,
                          weight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.notifications,
                      color: AppColor.whiteColor,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                Txt(
                  text: 'Shubuh',
                  size: 20,
                  weight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
                const SizedBox(height: 10.0),
                Txt(
                  text:
                      'Yang membedakan antara orang beriman dengan tidak beriman adalah meninggalkan salat.',
                  size: 13,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  color: AppColor.whiteColor,
                ),
                const SizedBox(height: 20.0),
                Cntr(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                  radius: BorderRadius.circular(15),
                  color: AppColor.whiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios_new_sharp),
                      Txt(
                        text: "20 April 2025",
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                for (var i = 0; i < 6; i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImagesUrl.icon1),
                        Txt(
                          text: "Imsak",
                          size: 20,
                          weight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                    
                        Txt(
                          text: "04:20",
                          size: 20,
                          weight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
