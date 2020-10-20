import 'package:flutter/material.dart';
import 'package:restaurantApp/screens/home.dart';

Map<String, Widget Function(BuildContext)> routers = {
  Home.routeName: (ctx) => Home(),
};
