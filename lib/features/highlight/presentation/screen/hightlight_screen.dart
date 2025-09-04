import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/dispatch/hightlight_dispatcher.dart';
import 'package:MONO29/features/highlight/bloc/hightlight_bloc.dart';
import 'package:MONO29/features/info/presentation/screen/contact_widget.dart';
import 'package:MONO29/features/highlight/presentation/widgets/hightlight_widget.dart';
import 'package:MONO29/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightlightScreen extends StatefulWidget {
  const HightlightScreen({super.key});

  @override
  State<HightlightScreen> createState() => _HightlightScreenState();
}

class _HightlightScreenState extends State<HightlightScreen> {
  int currentPage = 0;
  bool _isContact = false;
  final analytics = getIt<AnalyticsService>();

  @override
  void initState() {
    super.initState();
    analytics.logScreenView('hightlight');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HightlightBloc(),
        child: BlocBuilder<HightlightBloc, HightlightState>(
          builder: (context, state) {
            if (state is HLSetIsContactState) {
              _isContact = state.isContact;
            }
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(WidthHeight.appBarHeight),
                child: InkWell(
                  onTap: () {
                    analytics.logEvent('tap_appbar_to_contact');
                    HightlightDispatcher.disPatchIsContact(context);
                  },
                  child: CustomAppBar(
                      title: _isContact ? 'ติดต่อ' : 'ไฮไลท์',
                      currentIndex: _isContact ? 5 : 1),
                ),
              ),
              backgroundColor: AppColors.hightlightScreen,
              body: _isContact ? ContactWidget() : HightlightWidget(),
            );
          },
        ),
      ),
    );
  }
}
