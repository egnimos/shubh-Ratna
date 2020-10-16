import 'package:flutter/material.dart';
import 'package:restaurantApp/config/responsive.dart';
import 'package:restaurantApp/widgets/clipper.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scrollBuilder(context),
    );
  }
}

Widget scrollBuilder(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        //clippers
        clipper(context),

        //app Name
        _appName(context),

        //login by google

        //refer Name (optional to fill up)

        //register by google

        //label "create an account"
        // Spacer(),
        createAnAccountText(context),
      ],
    ),
  );
}

Widget _appName(BuildContext context) {
  return Transform.translate(
    offset: Offset(-70, -250),
    child: Text(
      "Shubh \n     Ratna",
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: SizeConfig.textMultiplier * 7.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Ubuntu"),
    ),
  );
}

Widget clipper(BuildContext context) {
  return Opacity(
    opacity: 0.7,
    child: ClipPath(
      clipper: ClippingClass(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 320.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg"))),
      ),
    ),
  );
}

Widget createAnAccountText(BuildContext context) {
  return RichText(
    text: TextSpan(
        text: "Create an account?  ",
        style: Theme.of(context).textTheme.bodyText1,
        children: [
          TextSpan(
            text: "Register",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
          ),
        ]),
  );
}
