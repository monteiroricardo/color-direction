import 'package:colors_direction/pages/expanded.page.dart';
import 'package:colors_direction/pages/home.page.dart';
import 'package:colors_direction/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RoutesApp.HOME,
    routes: {
      RoutesApp.HOME: (ctx) => HomePage(),
    },
  ));

  SystemChrome.setEnabledSystemUIOverlays([]);
}
