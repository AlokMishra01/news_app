import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListItem extends StatelessWidget {
  final NewsModel news;

  const NewsListItem({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: news.image ?? '',
              fit: BoxFit.contain,
              placeholder: (_, __) {
                return Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.contain,
                );
              },
              errorWidget: (_, __, ___) {
                return Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.contain,
                );
              },
            ),
            // child: Image.network(
            //   news.image ?? '',
            //   fit: BoxFit.contain,
            // ),
          ),
          const SizedBox(height: 8.0),
          Text(
            news.title ?? '',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    AppLocalizations.of(context)!.minutesAgo(
                      DateTime.now()
                          .difference(
                            DateTime.parse(news.publishDate ?? ''),
                          )
                          .inMinutes,
                    ),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  launch(news.url ?? '');
                },
                child: Text(
                  AppLocalizations.of(context)!.read,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
