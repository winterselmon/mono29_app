import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:MONO29/core/dispatch/rerun_dispatcher.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';

class RerunRelatedList extends StatelessWidget {
  final List<RerunNewsItem> related;

  const RerunRelatedList({super.key, required this.related});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: related.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = related[index];
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
                  'assets/images/default-thumbnail320.jpg',
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
