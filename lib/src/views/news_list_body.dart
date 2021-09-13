import 'package:flutter/material.dart';

import '../widget/news_list_item.dart';

class NewsListBody extends StatelessWidget {
  final int noOfItems;

  const NewsListBody({
    Key? key,
    this.noOfItems = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: ListView.separated(
        itemBuilder: (cxt, index) {
          return const NewsListItem();
        },
        separatorBuilder: (cxt, index) {
          return const SizedBox(height: 8.0);
        },
        itemCount: noOfItems,
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
