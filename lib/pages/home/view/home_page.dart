import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/pages/home/bloc/home_bloc.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetQuranEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.isDoa == false ? _headerQuran() :
                _headerDoa(),
                const SizedBox(height: 20.0),
                Txt(text: "Kategori", weight: FontWeight.bold, size: 16),
                const SizedBox(height: 10.0),
                _category(context,state),
                const SizedBox(height: 20.0),
                _body(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  _body(BuildContext context, HomeState state) {
    if (state.isLoading == true) {
      return Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (state.listSurat != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Cntr(
            height: MediaQuery.sizeOf(context).height / 1.8,
            radius: BorderRadius.circular(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < state.listSurat!.length; i++)
                    _surat(context, i, state.listSurat!),
                ],
              ),
            ),
          ),
        ],
      );
    }
    if (state.error != "") {
      return Center(child: Text(state.error));
    }
    return Txt(text: "text");
  }

  _surat(BuildContext context, int index, List<Surat> listSurat) {
    final surat = listSurat[index];
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
                        text: "${index + 1}",
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
                          text: surat.namaLatin!,
                          weight: FontWeight.w500,
                          size: 16,
                          color: AppColor.bgAppBlack,
                        ),
                        Txt(
                          text:
                              '${surat.tempatTurun} . ${surat.jumlahAyat} Ayat',
                          weight: FontWeight.w500,
                          size: 12,
                          color: AppColor.greyColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Txt(
                  text: "${surat.nama}",
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

  Row _category(BuildContext context, HomeState state) {
   final isDoa = state.isDoa;
    return Row(
      children: [
        Cntr(
          ontap: () {
            context.read<HomeBloc>().add(SwitchToQuranEvent());
          },
          child: Txt(text: 'Surat', color:isDoa == false ? AppColor.whiteColor : AppColor.blackColor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          radius: BorderRadius.circular(15),
          color:isDoa == false? AppColor.bgApp : AppColor.whiteColor,
          
          border: Border.all(color: isDoa == false ? AppColor.bgApp : AppColor.blackColor),

        ),
        const SizedBox(width: 10.0),
        Cntr(
          ontap: () {
            context.read<HomeBloc>().add(SwitchToDoaEvent());
            
          },
          child: Txt(text: 'Doa', color: isDoa ? AppColor.whiteColor : AppColor.blackColor),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          radius: BorderRadius.circular(15),
          color:isDoa ? AppColor.bgApp : AppColor.whiteColor,
          border: Border.all(color: isDoa ? AppColor.bgApp : AppColor.blackColor),
        ),
      ],
    );
  }

  Row _headerQuran() {
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

  Row _headerDoa() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Cntr(
          height: 210,
          width: 210,
          image: DecorationImage(image: AssetImage(AppImagesUrl.image1)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              text: "My Quran",
              size: 30,
              color: AppColor.bgApp,
              weight: FontWeight.bold,
            ),
            Txt(text: "Baca Doa-Doa"),
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
      ],
    );
  }
}
