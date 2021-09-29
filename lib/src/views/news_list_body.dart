import 'package:flutter/material.dart';
import 'package:news_app/models/news_response_model.dart';

import '../widget/news_list_item.dart';

class NewsListBody extends StatelessWidget {
  final List<NewsModel> news;
  final int noOfItems;
  final Function refresh;
  final Function loadMore;
  final bool loadingMore;

  const NewsListBody({
    Key? key,
    this.noOfItems = 0,
    this.news = const [],
    required this.refresh,
    required this.loadMore,
    this.loadingMore = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await refresh();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            // log(scrollInfo.metrics.pixels.toString(), name: 'ScrollInfo');
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              loadMore();
            }
            return true;
          },
          child: ListView.separated(
            itemBuilder: (cxt, index) {
              if (loadingMore && index == news.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return NewsListItem(
                news: news[index],
              );
            },
            separatorBuilder: (cxt, index) {
              return const SizedBox(height: 8.0);
            },
            itemCount: news.length + (loadingMore ? 1 : 0),
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 80.0,
              left: 8.0,
              right: 8.0,
            ),
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
