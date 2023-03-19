
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppLocalizations {
  final String localName;

  AppLocalizations(this.localName);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  YamlMap? translations;

  Future load() async {
    String yamlString = await rootBundle.loadString('lang/$localName.yml');
    translations = loadYaml(yamlString);
  }

  String t(String key) {
    try {
      var keys = key.split('.');
      dynamic translated = translations;
      for (var k in keys) {
        translated = translated![k];
      }
      if (translated == null) return key;
      return translated;
    } catch (e) {
      return key;
    }
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en', 'it'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var t = AppLocalizations(locale.languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
