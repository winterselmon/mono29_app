import 'package:MONO29/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompanyMapWidget extends StatefulWidget {
  final String map;
  const CompanyMapWidget({required this.map, super.key});

  @override
  State<CompanyMapWidget> createState() => _CompanyMapWidgetState();
}

class _CompanyMapWidgetState extends State<CompanyMapWidget> {
  double screenWidth = 0.0;
  final double companyLocationHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: AppColors.suggestionsZone2,
      height: companyLocationHeight,
      padding: EdgeInsets.all(20),
      child: CachedNetworkImage(
        imageUrl: widget.map,
        errorWidget: (context, url, error) => Icon(Icons.error),
        placeholder: (context, url) =>
            Image.asset('assets/images/default-thumbnail320.jpg'),
      ),
    );
  }
}
