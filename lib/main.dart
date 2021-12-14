import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_walkthrough/bloc_example/pet_facts_bloc_pattern.dart';
import 'package:flutter_app_walkthrough/resources/colors.dart';
import 'package:flutter_app_walkthrough/resources/strings.dart';
import 'package:flutter_app_walkthrough/stateful_widget_example/home_page.dart';
import 'package:flutter_app_walkthrough/util/color_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // App router
    Map<String, WidgetBuilder> router = <String, WidgetBuilder>{
      '/': (BuildContext context) => const MyHomePage(
          title: ResStrings.flutterAppTitle,
          description: ResStrings.flutterAppDescription),
      '/petsBloc': (BuildContext context) =>
          const PetFactsBlocWidget(),
    };

    // App root
    return Platform.isIOS
        ? CupertinoApp(
            title: ResStrings.flutterAppTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: const CupertinoThemeData(brightness: Brightness.light),
            routes: router,
          )
        : MaterialApp(
            title: ResStrings.flutterAppTitle,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: ColorUtil.createMaterialColor(
                const Color(ResColors.primaryColor),
              ),
            ),
            initialRoute: '/',
            routes: router,
          );
  }
}
