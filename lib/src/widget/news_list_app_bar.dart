import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../views/settings_view.dart';

PreferredSizeWidget buildNewsListAppBar({required BuildContext context}) {
  return PreferredSize(
    child: Container(
      height: 60.0 + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 6.0,
                  height: 28.0,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'News Today',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.slidersH,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.restorablePushNamed(
                  context,
                  SettingsView.settingPageRoute,
                );
              },
            ),
          ],
        ),
      ),
    ),
    preferredSize: const Size(
      double.infinity,
      60.0,
    ),
  );
}
