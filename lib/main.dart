import 'package:flutter/material.dart';
import 'package:veterinerim/loginpages/login_page.dart';
import 'package:veterinerim/userpage/animals.dart';
import 'package:veterinerim/userpage/animals_add.dart';
import 'package:veterinerim/userpage/home.dart';
import 'package:veterinerim/veterinarypage/vet_home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:veterinerim/yonlendirici.dart';
void main() => runApp(MaterialApp(
  home: Yonlendirici(),

  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate, // if it's a RTL language
  ],
  supportedLocales: [
    const Locale('tr', 'TR'), // include country code too
  ],

));

