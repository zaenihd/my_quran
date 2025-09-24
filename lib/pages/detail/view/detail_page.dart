import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/app_color.dart';
import 'package:my_quran/helper/hive/hive_helper.dart';
import 'package:my_quran/pages/detail/bloc/detail_bloc.dart';
import 'package:my_quran/widget/container/cntr.dart';
import 'package:my_quran/widget/text/txt.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});
  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    player = AudioPlayer();
    context.read<DetailBloc>().add(
      GetDetailSuratEvent(
        idSurat: widget.id,
        boxDetailSurah: HiveHelper.getDetailSurat(),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    player.stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.suratDetail != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Txt(
                      text: state.suratDetail!.data.namaLatin,
                      size: 30,
                      weight: FontWeight.bold,
                      color: AppColor.bgApp,
                    ),
                    Txt(text: state.suratDetail!.data.arti),
                    const SizedBox(height: 50.0),
                    for (
                      var i = 0;
                      i < state.suratDetail!.data.ayat.length;
                      i++
                    )
                      _ayat(context, state, i),
                    const SizedBox(height: 30.0),
                  ],
                ),
              );
            }
            if (state.error != "") {
              return Center(child: Txt(text: state.error));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  _ayat(BuildContext context, DetailState state, int index) {
    final dataSurat = state.suratDetail!.data.ayat[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Cntr(
          radius: BorderRadius.circular(10),
          color: AppColor.bgAppLight.withOpacity(0.10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Cntr(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                color: AppColor.bgAppLight,
                radius: BorderRadius.circular(100),
                // child: Icon(Icons.play_arrow, size: 20, color: AppColor.whiteColor,),
                child: Txt(text: "${index + 1}", color: AppColor.whiteColor),
              ),
              Row(
                children: [
                  Icon(Icons.share_outlined, color: AppColor.bgAppLight),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () async {
                      await player.play(

                        UrlSource(
                          '${state.suratDetail!.data.ayat[index].audio['02']}',
                        ),
                      );
                    },
                    child: Icon(
                      Icons.play_arrow_outlined,
                      color: AppColor.bgAppLight,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.bookmark_border_outlined,
                    color: AppColor.bgAppLight,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Align(
          alignment: Alignment.centerRight,
          child: Txt(
            text: dataSurat.teksArab,
            weight: FontWeight.bold,
            size: 18,
          ),
        ),
        const SizedBox(height: 16.0),
        Txt(text: dataSurat.teksIndonesia, weight: FontWeight.w400, size: 16),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
