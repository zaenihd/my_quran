import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [_header(), const SizedBox(height: 20.0), _body(context)],
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(text: "Kategori", weight: FontWeight.bold, size: 16),
        const SizedBox(height: 10.0),
        _category(),
        const SizedBox(height: 20.0),
        Cntr(
          height: MediaQuery.sizeOf(context).height / 1.8,
          radius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            child: Column(
              children: [for (var i = 0; i < 10; i++) _surat(context)],
            ),
          ),
        ),
      ],
    );
  }

  _surat(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: Row(
        children: [
          Cntr(
            width: 10,
            height: 65,
            color: AppColor.bgApp,
            radius: BorderRadius.circular(20),
          ),
          const SizedBox(width: 10.0),
          Cntr(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            radius: BorderRadius.circular(10),
            width: MediaQuery.sizeOf(context).width / 1.18,
            color: AppColor.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Cntr(
                      alignment: Alignment.center,
                      child: Txt(
                        text: "1",
                        weight: FontWeight.bold,
                        color: AppColor.bgAppBlack,
                      ),
                      height: 36,
                      width: 36,
                      image: DecorationImage(
                        image: AssetImage(AppImagesUrl.ayat),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Txt(
                          text: 'Al-Fatihah',
                          weight: FontWeight.w500,
                          size: 16,
                          color: AppColor.bgAppBlack,
                        ),
                        Txt(
                          text: 'Mekah . 7 Ayat',
                          weight: FontWeight.w500,
                          size: 12,
                          color: AppColor.greyColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Txt(
                  text: "ةحتافلا",
                  size: 20,
                  weight: FontWeight.bold,
                  color: AppColor.bgApp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _category() {
    return Row(
      children: [
        Cntr(
          child: Txt(text: 'Surat', color: AppColor.whiteColor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          radius: BorderRadius.circular(15),
          color: AppColor.bgApp,
        ),
        const SizedBox(width: 10.0),
        Cntr(
          child: Txt(text: 'Doa', color: AppColor.blackColor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          radius: BorderRadius.circular(15),
          border: Border.all(),
        ),
      ],
    );
  }

  Row _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              text: "My Quran",
              size: 30,
              color: AppColor.bgApp,
              weight: FontWeight.bold,
            ),
            Txt(text: "Baca Al-Quran Dengan\nMudah"),
            Txt(
              text: "19:20",
              size: 36,
              color: AppColor.blackColor,
              weight: FontWeight.bold,
            ),
            Txt(text: "Ramadan 23, 1444 AH", weight: FontWeight.bold, size: 10),
            const SizedBox(height: 10.0),
            Cntr(
              child: Txt(text: 'Shubuh 4:17', color: AppColor.whiteColor),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              radius: BorderRadius.circular(5),
              color: AppColor.bgApp,
            ),
          ],
        ),
        Cntr(
          height: 210,
          width: 210,
          image: DecorationImage(image: AssetImage(AppImagesUrl.image3)),
        ),
      ],
    );
  }
}
