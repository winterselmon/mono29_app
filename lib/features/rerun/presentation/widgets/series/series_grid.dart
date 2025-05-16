import 'package:flutter/material.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';

class SeriesGrid extends StatelessWidget {
  final List<SeriesItem> items;

  const SeriesGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 16 / 9,
      ),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            printLog('Tapped item at index: $index');
          },
          child: Container(
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: items[index].thumbnailUrl ?? '',
              errorWidget: (_, __, ___) => const Icon(Icons.error),
              placeholder: (_, __) => Image.asset(
                'assets/images/default-thumbnail320.jpg',
              ),
            ),
          ),
        );
      },
    );
  }
}
