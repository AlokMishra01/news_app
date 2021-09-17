import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            const Expanded(
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
