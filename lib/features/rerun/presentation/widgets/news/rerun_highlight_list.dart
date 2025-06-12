// ตัวอย่างสำหรับ rerun_highlight_list.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';

class RerunHighlightList extends StatelessWidget {
  final List<RerunNewsItem> highlight;

  const RerunHighlightList({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: highlight.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = highlight[index];
        return GestureDetector(
          // onTap: () => RerunDispatcher.disPatchRerunNewsSingle(
          //   context,
          //   item.pid,
          //   item.id,
          // ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: item.img,
                fit: BoxFit.cover,
                width: 160,
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                placeholder: (_, __) => Image.asset(
                  'assets/images/Mono_29_Logo.png',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
