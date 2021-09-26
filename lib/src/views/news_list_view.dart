import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/api/get_news.dart';
import 'package:news_app/models/news_response_model.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildNewsListAppBar(context: context),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(36.0),
              ),
              child: Material(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(36.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TabBar(
                    physics: const BouncingScrollPhysics(),
                    indicatorColor: Theme.of(context).primaryColor,
                    isScrollable: true,
                    labelColor: Theme.of(context).focusColor,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 6.0,
                    labelStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: AppLocalizations.of(context)!.all),
                      Tab(text: AppLocalizations.of(context)!.political),
                      Tab(text: AppLocalizations.of(context)!.business),
                      Tab(text: AppLocalizations.of(context)!.health),
                      Tab(text: AppLocalizations.of(context)!.sports),
                      Tab(text: AppLocalizations.of(context)!.others),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  if (_loading)
                    Center(child: const CircularProgressIndicator()),
                  if (!_loading)
                    NewsListBody(
                        news: newsData!.newsList,
                        refresh: () async {
                          _page = 1;
                          await _loadNews();
                        }),
                  if (_politicalLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (!_politicalLoading)
                    NewsListBody(
                        news: politicalNewsData!.newsList,
                        refresh: () async {
                          _politicalPage = 1;
                          await _politicalLoadNews();
                        }),
                  NewsListBody(
                    noOfItems: 6,
                    refresh: () {},
                  ),
                  NewsListBody(
                    noOfItems: 7,
                    refresh: () {},
                  ),
                  NewsListBody(
                    noOfItems: 9,
                    refresh: () {},
                  ),
                  NewsListBody(
                    noOfItems: 3,
                    refresh: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadNews();
    _politicalLoadNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  NewsResponseModel? newsData;
  bool _loading = true;
  int _page = 1;
  NewsResponseModel? politicalNewsData;
  bool _politicalLoading = true;
  int _politicalPage = 1;
  NewsResponseModel? businessNewsData;
  bool _businessLoading = true;
  NewsResponseModel? healthNewsData;
  bool _healthLoading = true;
  NewsResponseModel? sportsNewsData;
  bool _helthLoading = true;
  NewsResponseModel? othersNewsData;
  bool _othersLoading = true;

  _loadNews() async {
    var news = await GetNewsService().getNews(
      page: _page,
    );
    if (_page == 1) {
      newsData = news;
    } else {
      if (newsData == null) newsData = NewsResponseModel(newsList: []);
      newsData!.newsList.addAll(news!.newsList);
    }
    _loading = false;
    setState(() {});
  }

  _politicalLoadNews() async {
    var news = await GetNewsService().getNews(
      query: 'political',
      page: _politicalPage,
    );
    if (_page == 1) {
      politicalNewsData = news;
    } else {
      politicalNewsData!.newsList.addAll(news!.newsList);
    }
    _politicalLoading = false;
    setState(() {});
  }
}
