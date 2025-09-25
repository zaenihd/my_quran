import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/jadwal_solat.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/helper/hive/hive_helper.dart';
import 'package:my_quran/helper/navigator/app_navigator.dart';
import 'package:my_quran/helper/navigator/route_name.dart';
import 'package:my_quran/pages/home/bloc/home_bloc.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _timeString;
  late Timer _timer;

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(
      GetQuranEvent(boxSurat: HiveHelper.getAllSurat()),
    );
    context.read<HomeBloc>().add(GetDoaEvent(boxDoa: HiveHelper.getDoa()));
    context.read<HomeBloc>().add(GetJadwalSolatEvent(cityId: "1"));
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (Timer t) => _getTime(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                state.isDoa == false
                    ? _headerQuran(state.jadwalSolat!)
                    : _headerDoa(),
                const SizedBox(height: 20.0),
                Txt(text: "Kategori", weight: FontWeight.bold, size: 16),
                const SizedBox(height: 10.0),
                _category(context, state),
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
            child: state.isDoa
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < state.listDoa!.length; i++)
                          _doa(context, i, state.listDoa!),
                      ],
                    ),
                  )
                : SingleChildScrollView(
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
            ontap: () {
              // context.go("${RouteName.detail}/${listSurat[index].nomor}");
              context.goNamed(
                RouteName.detail,
                pathParameters: {"idSurat": listSurat[index].nomor.toString()},
              );
            },
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
                      height: 36,
                      width: 36,
                      image: DecorationImage(
                        image: AssetImage(AppImagesUrl.ayat),
                      ),
                      child: Txt(
                        text: "${index + 1}",
                        weight: FontWeight.bold,
                        color: AppColor.bgAppBlack,
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

  _doa(BuildContext context, int index, List<Doa> listDoa) {
    final surat = listDoa[index];
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
            ontap: () {
              context.goNamed(RouteName.doa, extra: listDoa[index]);
            },
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 65,
            radius: BorderRadius.circular(10),
            width: MediaQuery.sizeOf(context).width / 1.18,
            color: AppColor.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.4,
                  child: Txt(
                    textOverFlow: TextOverflow.clip,
                    maxLines: 2,
                    text: surat.judul,
                    weight: FontWeight.w500,
                    size: 16,
                    color: AppColor.bgAppBlack,
                  ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Cntr(
              ontap: () {
                context.read<HomeBloc>().add(SwitchToQuranEvent());
              },
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              radius: BorderRadius.circular(15),
              color: isDoa == false ? AppColor.bgApp : AppColor.whiteColor,

              border: Border.all(
                color: isDoa == false ? AppColor.bgApp : AppColor.blackColor,
              ),
              child: Txt(
                text: 'Surat',
                color: isDoa == false
                    ? AppColor.whiteColor
                    : AppColor.blackColor,
              ),
            ),
            const SizedBox(width: 10.0),
            Cntr(
              ontap: () {
                context.read<HomeBloc>().add(SwitchToDoaEvent());
              },
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              radius: BorderRadius.circular(15),
              color: isDoa ? AppColor.bgApp : AppColor.whiteColor,
              border: Border.all(
                color: isDoa ? AppColor.bgApp : AppColor.blackColor,
              ),
              child: Txt(
                text: 'Doa',
                color: isDoa ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
          ],
        ),
        // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        InkWell(
          onTap: () {
            context.goNamed(RouteName.search, extra: state.listSurat);
          },
          child: Icon(Icons.search, color: AppColor.bgApp),
        ),
      ],
    );
  }

  Row _headerQuran(JadwalSolatModel jadwalSolat) {
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
              text: _timeString,
              size: 36,
              color: AppColor.blackColor,
              weight: FontWeight.bold,
            ),
            // Txt(text: "Ramadan 23, 1444 AH", weight: FontWeight.bold, size: 10),
            const SizedBox(height: 10.0),
            Cntr(
              ontap: () {
                context.pushNamed(RouteName.jadwalSolat);
              },
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              radius: BorderRadius.circular(5),
              color: AppColor.bgApp,
              child: Txt(
                text: jadwalSolat.data.data.adzan.isya,
                color: AppColor.whiteColor,
              ),
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
              text: _timeString,
              size: 36,
              color: AppColor.blackColor,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 10.0),
            Cntr(
              ontap: () {
                context.pushNamed(RouteName.jadwalSolat);
              },
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              radius: BorderRadius.circular(5),
              color: AppColor.bgApp,
              child: Txt(text: 'Shubuh 4:17', color: AppColor.whiteColor),
            ),
          ],
        ),
      ],
    );
  }
}
