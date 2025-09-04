import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/info/data/info_data_source.dart';
import 'package:MONO29/features/info/data/models/info_response_model.dart';
import 'package:MONO29/features/info/presentation/widgets/company_map_widget.dart';
import 'package:MONO29/features/info/presentation/widgets/contact_location_widget.dart';
import 'package:MONO29/features/info/presentation/widgets/contact_tel_widget.dart';
import 'package:MONO29/features/info/presentation/widgets/logo_suggest_widget.dart';
import 'package:MONO29/features/info/presentation/widgets/user_agreement_widget.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  double screenWidth = 0;
  final contactLocationHeight = 220.0;
  late Future<InfoResponseModel> _infoFuture;
  final analytics = getIt<AnalyticsService>();

  Future<InfoResponseModel> fetchInfo() async {
    final apiService = ApiService();

    try {
      InfoResponseModel infoResponseModel =
          await InfoDataSource(apiService).infoFeed();

      return infoResponseModel;
    } catch (e) {
      printLog(e);
      throw Exception('Failed to fetch highlights: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    _infoFuture = fetchInfo();
    analytics.logScreenView('contact');
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _infoFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // แสดงตอนกำลังโหลด
                } else if (snapshot.hasError) {
                  return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LogoSuggestWidget(
                        data: data.data!,
                      ),
                      ContactLocationWidget(
                        address: data.data!.address ?? '',
                      ),
                      ContactTelWidget(
                        tel: data.data!.tel ?? '',
                        fax: data.data!.fax ?? '',
                      ),
                      CompanyMapWidget(
                        map: data.data!.map ?? '',
                      ),
                      UserAgreementWidget(
                        data: data.data!,
                      ),
                    ],
                  );
                } else {
                  return Text('ไม่มีข้อมูล');
                }
              }),
        ),
      ),
    );
  }
}
