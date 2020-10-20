import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurantApp/screens/home.dart';
// import 'package:restaurantApp/config/responsive.dart';

//login button
Widget login(BuildContext context) {
  return RaisedButton.icon(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Theme.of(context).primaryColor,
    hoverColor: Theme.of(context).primaryColorLight,
    onPressed: () {
      Navigator.of(context).pushNamed(Home.routeName);
    },
    icon: Icon(
      FontAwesomeIcons.google,
      color: Colors.white,
    ),
    label: Text(
      "Login",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    ),
  );
}

//register button
Widget register(BuildContext context) {
  return RaisedButton.icon(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Theme.of(context).primaryColor,
    hoverColor: Theme.of(context).primaryColorLight,
    onPressed: () {},
    icon: Icon(
      FontAwesomeIcons.google,
      color: Colors.white,
    ),
    label: Text(
      "Register",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    ),
  );
}
