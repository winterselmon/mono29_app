import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/check_mode_utils.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/highlight/bloc/hightlight_bloc.dart';
import 'package:MONO29/features/highlight/data/highlight_data_source.dart';
import 'package:MONO29/features/highlight/data/models/highlight_response_model.dart';
import 'package:MONO29/features/highlight/presentation/widgets/dot_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightlightWidget extends StatefulWidget {
  const HightlightWidget({super.key});

  @override
  State<HightlightWidget> createState() => _HightlightWidgetState();
}

class _HightlightWidgetState extends State<HightlightWidget> {
  int currentPage = 0;
  final double _cardHeight = 450;
  late Future<HighlightResponseModel> _highlightsFuture;

  _disPatchPageIndex(BuildContext context, int index) {
    context.read<HightlightBloc>().add(HLSetCurrentPageEvent(index));
  }

  Future<HighlightResponseModel> fetchHighlights() async {
    final apiService = ApiService();

    try {
      HighlightResponseModel highlightsres =
          await HighlightDataSource(apiService).getHighlightFeed();

      return highlightsres;
    } catch (e) {
      printLog(e);
      throw Exception('Failed to fetch highlights: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _highlightsFuture = fetchHighlights();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HightlightBloc(),
        child: BlocBuilder<HightlightBloc, HightlightState>(
          builder: (context, state) {
            if (state is HLSetCurrentPageState) {
              currentPage = state.currentPage;
            }
            return SizedBox(
              width: screenWidth(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                          future: _highlightsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child:
                                      CircularProgressIndicator()); // แสดงตอนกำลังโหลด
                            } else if (snapshot.hasError) {
                              return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final data = snapshot.data!;
                              return CarouselSlider.builder(
                                itemCount: data.data!.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  HighlightItem highlightItem =
                                      data.data![index];
                                  // currentPage = index;
                                  return GestureDetector(
                                    onTap: () {
                                      handleMode(
                                        context,
                                        highlightItem.mode!,
                                        highlightItem.url!,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl: data.data![index].thumbnail!,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        placeholder: (context, url) =>
                                            Image.asset(
                                                'assets/images/Mono_29_Logo.png'),
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: _cardHeight,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    _disPatchPageIndex(context, index);
                                  },
                                ),
                              );
                            } else {
                              return Text('ไม่มีข้อมูล');
                            }
                          })
                    ],
                  ),
                  DotIndicatorWidget(currentPage: currentPage)
                ],
              ),
            );
          },
        ));
  }
}
