import 'package:flutter/material.dart';
import 'package:news_app/models/news_response_model.dart';

import '../widget/news_list_item.dart';

class NewsListBody extends StatelessWidget {
  final List<NewsModel> news;
  final int noOfItems;

  const NewsListBody({
    Key? key,
    this.noOfItems = 0,
    this.news = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: ListView.separated(
        itemBuilder: (cxt, index) {
          return NewsListItem(
            news: news[index],
          );
        },
        separatorBuilder: (cxt, index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: news.length,
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 80.0,
          left: 8.0,
          right: 8.0,
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
