import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_redux_mall/constant/colors.dart';
import 'package:flutter_redux_mall/page/demo/page.dart';
import 'package:flutter_redux_mall/page/login/page.dart';
import 'package:flutter_redux_mall/net/dio_util.dart';
import 'package:flutter_redux_mall/page/main/page.dart';

Widget createApp() {
  doInit();
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        '/demo': DemoPage(),
        '/login': LoginPage(),
        '/main': MainPage(),
      },
    ),
  ]);

  return MaterialApp(
    title: 'Redux Mall',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: mainMaterialColor,
    ),
    home: routes
        .buildPage('/main', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

void doInit() {
  DioUtil.init();
}
