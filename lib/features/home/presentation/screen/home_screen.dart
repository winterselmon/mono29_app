import 'package:MONO29/core/constants/global_values.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/app_pref_key.dart';
import 'package:MONO29/core/utils/app_preferences.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/bloc/bloc/home_bloc.dart';
import 'package:MONO29/features/home/constants/home_constants.dart';
import 'package:MONO29/features/home/data/home_data_source.dart';
import 'package:MONO29/features/home/data/home_repository_impl.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';
import 'package:MONO29/features/home/presentation/dialog/app_user_agreement_dialog.dart';
import 'package:MONO29/features/home/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:MONO29/features/live/presentation/screen/live_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 1;
  final ApiService _apiService = ApiService();
  bool isShowDialog = false;

  void _showAppUserAgreement(BuildContext context, Data data) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => AppUserAgreementDialog(
        data: data,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _setPermission();

    AppPreferences.setBool(
      AppPrefKeys.isShowDialog,
      false,
    );

    _checkUserAgreementShown();

    _pageController = PageController(initialPage: 1);
  }

  _setPermission() async {
    await Permission.storage.request();
  }

  void _checkUserAgreementShown() async {
    bool isShown = await AppPreferences.getBool(AppPrefKeys.isShowDialog);
    GlobalValues.isShowDialog = isShown;
  }

  _onTapMenu(int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LiveScreen(
            onBack: () {
              // กลับมาที่หน้า Home แล้วเซ็ต index เป็นหน้าเดิม (เช่น 1)
              setState(() {
                _currentIndex = 1;
                _pageController.jumpToPage(_currentIndex);
              });
            },
          ),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
        _pageController.jumpToPage(_currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) =>
            HomeBloc(HomeRepositoryImpl(HomeDataSource(_apiService)))
              ..add(CheckVersionEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSetCurrentPageState) {
              _currentIndex = state.currentIndex;
              _pageController.jumpToPage(_currentIndex);
            } else if (state is ShowUserAgreement) {
              // if (!GlobalValues.isShowDialog) {
              //   WidgetsBinding.instance.addPostFrameCallback((_) {
              //     _showAppUserAgreement(
              //         context, state.userAgreementResponseModel.data!);
              //   });
              // }
              if (GlobalValues.isShowDialog == false) {
                if (state.userAgreementResponseModel.data != null) {
                  if (state.userAgreementResponseModel.data!.isShow!) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _showAppUserAgreement(
                        context,
                        state.userAgreementResponseModel.data!,
                      );
                    });
                  }
                }
              }
            }
            return PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: HomeConstants.widgetOptions(onBack: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LiveScreen(
                      onBack: () {
                        // กลับมาที่หน้า Home แล้วเซ็ต index เป็นหน้าเดิม (เช่น 1)
                        setState(() {
                          _currentIndex = 1;
                          _pageController.jumpToPage(_currentIndex);
                        });
                      },
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBarItem(
        currentIndex: _currentIndex,
        onTap: _onTapMenu,
      ),
    );
  }
}
