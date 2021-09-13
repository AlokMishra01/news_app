import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/news_list_app_bar.dart';
import 'news_list_body.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  static const newsListRoute = '/';

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: buildNewsListAppBar(context: context),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: const [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(36.0),
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(36.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    indicatorColor: Colors.red,
                    isScrollable: true,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.black38,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 6.0,
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Political'),
                      Tab(text: 'Business'),
                      Tab(text: 'Health'),
                      Tab(text: 'Sports'),
                      Tab(text: 'Others'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  NewsListBody(
                    noOfItems: 37,
                  ),
                  NewsListBody(
                    noOfItems: 12,
                  ),
                  NewsListBody(
                    noOfItems: 6,
                  ),
                  NewsListBody(
                    noOfItems: 7,
                  ),
                  NewsListBody(
                    noOfItems: 9,
                  ),
                  NewsListBody(
                    noOfItems: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
