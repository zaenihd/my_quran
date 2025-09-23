import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/app_images_url.dart';
import 'package:my_quran/helper/navigator/route_name.dart';
import 'package:my_quran/pages/search/cubit/search_cubit.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/text_field.dart';
import 'package:my_quran/widget/text/txt.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.surat});
  final List<Surat> surat;

  final TextEditingController searchC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt(
                  text: "Cari Surah",
                  size: 30,
                  weight: FontWeight.bold,
                  color: AppColor.bgApp,
                ),
                TxtForm(
                  onChange: (state1) {
                    context.read<SearchCubit>().getSearchSurat(state1, surat);
                  },
                  controller: searchC,
                  onTap: () {},
                  suffixIcon: Icon(Icons.search),
                  hintText: "Cari",
                  borderColor: Colors.grey,
                ),
                const SizedBox(height: 10.0),
                Cntr(
                  height: MediaQuery.sizeOf(context).height / 1.3,
                  child: SingleChildScrollView(
                    child: state.searchResult != null
                        ? Column(
                            children: [
                              for (
                                var i = 0;
                                i < state.searchResult!.length;
                                i++
                              )
                                _surat(context, i, state.searchResult!),
                            ],
                          )
                        : Column(
                            children: [
                              for (var i = 0; i < surat.length; i++)
                                _surat(context, i, surat),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
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
              context.pushNamed(
                RouteName.detail,
                pathParameters: {"idSurat": listSurat[index].nomor.toString()},
                extra: listSurat[index],
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
}
