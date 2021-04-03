import 'package:challenge/screens/home.dart';
import 'package:challenge/screens/splash.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> appRoutes = {
  "/": (_) => Splash(),
  "/home": (_) => Home()
};