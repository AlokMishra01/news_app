import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../settings/settings_view.dart';

PreferredSizeWidget buildNewsListAppBar({required BuildContext context}) {
  return PreferredSize(
    child: Container(
      height: 60.0 + MediaQuery.of(context).padding.top,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.vertical(
        //   bottom: Radius.circular(36.0),
        // ),
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
                  color: Colors.red,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'News Today',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.slidersH,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
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
