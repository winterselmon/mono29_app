import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/dispatch/rerun_dispatcher.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/utils/gradient_underline_custom.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/presentation/pages/highlight_tab_widget.dart';
import 'package:MONO29/features/rerun/presentation/pages/news_tab_widget.dart';
import 'package:MONO29/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RerunScreen extends StatefulWidget {
  const RerunScreen({super.key});

  @override
  State<RerunScreen> createState() => _RerunScreenState();
}

class _RerunScreenState extends State<RerunScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final analytics = getIt<AnalyticsService>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    analytics.logScreenView('rerun');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(WidthHeight.appBarHeight),
          child: CustomAppBar(
            title: 'ย้อนหลัง',
            currentIndex: 2,
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              addVerticalSpace(10),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.forDev1,
                    AppColors.forDev2,
                    AppColors.forDev3,
                  ],
                )),
                child: BlocProvider(
                  create: (context) => RerunBloc(
                      RerunRepositoryImpl(RerunDataSource(ApiService()))),
                  child: Builder(builder: (context) {
                    return TabBar(
                      onTap: (value) {
                        analytics.logEvent('switch_tab_rerun', parameters: {
                          'tab_index': value == 0 ? 'highlight' : 'news'
                        });
                        RerunDispatcher.disPatchIsFetchRerunTab(context, value);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      indicator: GradientUnderlineTabIndicator(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.deepOrange,
                            Colors.orange,
                          ],
                        ),
                        strokeWidth: 4.0,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      tabs: const <Widget>[
                        Tab(
                          child: Text('ไฮไลท์'),
                        ),
                        // Tab(
                        //   child: Text('ซีรีส์'),
                        // ),
                        Tab(
                          child: Text('ข่าวเด่น'),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              addVerticalSpace(20),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      HighlightTabWidget(),
                      // SeriesTabWidget(),
                      NewsTabWidget(),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
