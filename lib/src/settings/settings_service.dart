import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    try {
      var preferences = await SharedPreferences.getInstance();

      /// themeMode => System, Light, Dark
      String mode = preferences.getString('themeMode') ?? 'System';
      switch (mode) {
        case 'Light':
          return ThemeMode.light;
        case 'Dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    } catch (e) {
      log(e.toString());
      return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (theme) {
      case ThemeMode.light:
        preferences.setString('themeMode', 'Light');
        break;
      case ThemeMode.dark:
        preferences.setString('themeMode', 'Dark');
        break;
      default:
        preferences.setString('themeMode', 'System');
    }
  }

  Future<Locale> appLocale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    /// locale => ne (for nepali), en (for english)
    String locale = preferences.getString('locale') ?? 'en';

    switch (locale) {
      case 'ne':
        return Locale('ne', '');
      case 'en':
        return Locale('en', '');
      default:
        return Locale('en', '');
    }
  }

  Future<void> updateAppLocale(Locale locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (locale == Locale('ne', '')) {
      preferences.setString('locale', 'ne');
    } else if (locale == Locale('en', '')) {
      preferences.setString('locale', 'en');
    } else {
      preferences.setString('locale', 'en');
    }
  }
}
