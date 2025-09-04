import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/webview_helper.dart';
import 'package:MONO29/features/prnews/bloc/prnews_bloc.dart';
import 'package:MONO29/features/prnews/data/models/prnews_response_model.dart';
import 'package:MONO29/features/prnews/data/prnews_data_source.dart';
import 'package:MONO29/features/prnews/data/prnews_repository_impl.dart';
import 'package:MONO29/widgets/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _currentTab = 0;
  final ApiService _apiService = ApiService();
  PrNewsResponseModel? _cachedModel;
  List<Promotion>? _promotionList = [];
  List<Prnews>? _prnewsList = [];
  String titleOnWebview = 'PRNEWS';
  final analytics = getIt<AnalyticsService>();

  _setCurrentTab(int tab) {
    _currentTab = tab;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    analytics.logScreenView('event');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PrnewsBloc(PrnewsRepositoryImpl(PrnewsDataSource(_apiService)))
            ..add(FetchPrnewsEvent()),
      child: BlocBuilder<PrnewsBloc, PrnewsState>(
        builder: (context, state) {
          if (state is PrnewsLoaded) {
            _cachedModel = state.prNewsResponseModel;
            _prnewsList = _cachedModel!.data!.prnews;
            _promotionList = _cachedModel!.data!.promotion;
          }

          return SafeArea(
              child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(WidthHeight.appBarHeight),
              child: CustomAppBar(
                title: 'กิจกรรม',
                currentIndex: 4,
              ),
            ),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: screenHeight(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/BG.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            color: AppColors.prnewsHead,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    analytics.logEvent('switch_tab_event',
                                        parameters: {
                                          'tab_index': 'กิจกรรมร่วมสนุก'
                                        });
                                    _setCurrentTab(0);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(14),
                                    color: _currentTab == 0
                                        ? AppColors.whiteColor
                                        : AppColors.dotInactive,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            color: _currentTab == 0
                                                ? AppColors.dotInactive
                                                : AppColors.whiteColor,
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.gamepad,
                                              color: _currentTab == 0
                                                  ? AppColors.prnewsHead
                                                  : AppColors.dotInactive,
                                            ),
                                          ),
                                        ),
                                        addHorizontalSpace(4),
                                        Text(
                                          'กิจกรรมร่วมสนุก',
                                          style: TextStyle(
                                              color: _currentTab == 0
                                                  ? AppColors.dotInactive
                                                  : AppColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    analytics.logEvent('switch_tab_event',
                                        parameters: {
                                          'tab_index': 'ข่าวประชาสัมพันธ์'
                                        });
                                    _setCurrentTab(1);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(14),
                                    color: _currentTab == 1
                                        ? AppColors.whiteColor
                                        : AppColors.dotInactive,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            color: _currentTab == 1
                                                ? AppColors.dotInactive
                                                : AppColors.whiteColor,
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.list,
                                              color: _currentTab == 1
                                                  ? AppColors.prnewsHead
                                                  : AppColors.dotInactive,
                                            ),
                                          ),
                                        ),
                                        addHorizontalSpace(4),
                                        Text('ข่าวประชาสัมพันธ์',
                                            style: TextStyle(
                                                color: _currentTab == 1
                                                    ? AppColors.dotInactive
                                                    : AppColors.whiteColor)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 4,
                            color: AppColors.whiteColor,
                          )
                        ],
                      ),
                      _currentTab == 0
                          ? Container(
                              height: screenHeight(context) / 1.43,
                              width: screenWidth(context),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 2,
                                      ),
                                  itemCount: _promotionList!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          child: CachedNetworkImage(
                                            // width: 160,
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                'https://mono29.com/feed/images/goodnews.png',
                                            errorWidget: (_, __, ___) =>
                                                const Icon(Icons.error),
                                            placeholder: (_, __) => Image.asset(
                                              'assets/images/Mono_29_Logo.png',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          height: 120,
                                          'assets/images/border.png', // ใส่ path ให้ตรงกับโปรเจกต์คุณ
                                          width: screenWidth(context),
                                          fit: BoxFit
                                              .fill, // หรือ BoxFit.cover ถ้ากรอบมีขนาดพอดี
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          : SizedBox(
                              height: screenHeight(context) / 1.43,
                              width: screenWidth(context),
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                                itemCount: _prnewsList!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      analytics.logEvent('open_prnews_detail',
                                          parameters: {
                                            'prnews_id':
                                                _prnewsList![index].id ?? ''
                                          });
                                      WebViewHelper.openInAppWebView(
                                        context,
                                        _prnewsList![index].url ?? '',
                                        titleOnWebview,
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            width: screenWidth(context),
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                _prnewsList![index].img ?? '',
                                            errorWidget: (_, __, ___) =>
                                                const Icon(Icons.error),
                                            placeholder: (_, __) => Image.asset(
                                              'assets/images/Mono_29_Logo.png',
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth(context),
                                            padding: EdgeInsets.all(14),
                                            color: AppColors.whiteColor,
                                            child: Text(
                                              _prnewsList![index].title!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color:
                                                    AppColors.okButtonNotcheck,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
