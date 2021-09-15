import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/widget/setting_view_app_bar.dart';

import '../settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const settingPageRoute = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: buildSettingViewAppBar(
        context: context,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 8.0,
          left: 8.0,
          bottom: 80.0,
        ),
        children: [
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.language,
                color: Colors.red,
                size: 32.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.language,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32.0),
                      ),
                    ),
                    builder: (cxt) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CheckboxListTile(
                              title: Text(
                                AppLocalizations.of(context)!.english,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              activeColor: Colors.red,
                              value:
                                  const Locale('en', '') == controller.locale,
                              onChanged: (value) {
                                bool b = value ?? false;
                                if (b) {
                                  controller.updateLocale(
                                    const Locale('en', ''),
                                  );
                                }
                                Navigator.maybePop(context);
                              },
                            ),
                            CheckboxListTile(
                              title: Text(
                                AppLocalizations.of(context)!.nepali,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              activeColor: Colors.red,
                              value:
                                  const Locale('ne', '') == controller.locale,
                              onChanged: (value) {
                                bool b = value ?? false;
                                if (b) {
                                  controller.updateLocale(
                                    const Locale('ne', ''),
                                  );
                                }
                                Navigator.maybePop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.palette,
                color: Colors.red,
                size: 32.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.theme,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32.0),
                      ),
                    ),
                    builder: (cxt) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CheckboxListTile(
                              title: Text(
                                AppLocalizations.of(context)!.system,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              activeColor: Colors.red,
                              value: ThemeMode.system == controller.themeMode,
                              onChanged: (value) {
                                bool b = value ?? false;
                                if (b) {
                                  controller.updateThemeMode(ThemeMode.system);
                                }
                                Navigator.maybePop(context);
                              },
                            ),
                            CheckboxListTile(
                              title: Text(
                                AppLocalizations.of(context)!.light,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              activeColor: Colors.red,
                              value: ThemeMode.light == controller.themeMode,
                              onChanged: (value) {
                                bool b = value ?? false;
                                if (b) {
                                  controller.updateThemeMode(ThemeMode.light);
                                }
                                Navigator.maybePop(context);
                              },
                            ),
                            CheckboxListTile(
                              title: Text(
                                AppLocalizations.of(context)!.dark,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              activeColor: Colors.red,
                              value: ThemeMode.dark == controller.themeMode,
                              onChanged: (value) {
                                bool b = value ?? false;
                                if (b) {
                                  controller.updateThemeMode(ThemeMode.dark);
                                }
                                Navigator.maybePop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.eyeDropper,
                color: Colors.red,
                size: 32.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.appColor,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     AppLocalizations.of(context)!.newsCount(0),
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: 24.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
