import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/helper/app_navigator.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/widget/button/button.dart';
import 'package:my_quran/widget/text/txt.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height /5,),
            Image.asset(AppImagesUrl.logo),
            const SizedBox(
              height: 10.0,
            ),
            Txt(
              text: 'My Quran',
              size: 30,
              weight: FontWeight.bold,
              color: AppColor.bgApp,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Txt(text: 'Baca Al-Quran Degan Mudah', color: AppColor.greyColor,),
            SizedBox(height: MediaQuery.sizeOf(context).height /4,),
            ButtonCostum(
              margin: EdgeInsets.symmetric(horizontal: 50),
              title: "Baca Sekarang",
              
              onPressed: () {
                context.go(RouteName.home);
              },
              color: AppColor.bgApp,
            ),
          ],
        ),
      ),
    );
  }
}
