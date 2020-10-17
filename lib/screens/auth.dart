import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurantApp/config/responsive.dart';
import 'package:restaurantApp/widgets/button.dart';
import 'package:restaurantApp/widgets/clipper.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final referController = TextEditingController();
  bool isRegister = false;

  @override
  void dispose() {
    referController.dispose();
    super.dispose();
  }

  changeState() {
    print("hello");
    setState(() {
      isRegister ? isRegister = false : isRegister = true;
    });
  }

  Widget createAnAccountText(
    BuildContext context, {
    String text = "Create an account?  ",
    String text1 = "Register",
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => changeState(),
                text: text1,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ]),
      ),
    );
  }

  Widget userAgreement(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By Logging In,',
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            TextSpan(
              text: ' you accept the Shubh Ratna  ',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            TextSpan(
              text: 'User Agreement',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // navigate to desired screen
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget scrollBuilder(
      BuildContext context, TextEditingController referController) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            //clippers
            clipper(context),

            //app Name
            _appName(context),

            //login by google
            isRegister
                ? Container(
                    width: 0,
                    height: 0,
                  )
                : login(context),

            //refer Name (optional to fill up)
            isRegister
                ? inputField(context, referController)
                : Container(
                    width: 0,
                    height: 0,
                  ),

            isRegister
                ? SizedBox(
                    height: SizeConfig.heightMultiplier * 2.5,
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),

            //register by google
            isRegister
                ? register(context)
                : Container(
                    width: 0,
                    height: 0,
                  ),

            SizedBox(height: SizeConfig.heightMultiplier),

            //label "create an account"
            !isRegister
                ? createAnAccountText(
                    context,
                  )
                : createAnAccountText(
                    context,
                    text: "already have an account?  ",
                    text1: "login",
                  ),

            userAgreement(context),
          ],
        ),
      ),
    );
  }

  Widget inputField(
      BuildContext context, TextEditingController _referController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _referController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
          labelText: "Refer Name",
          labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: SizeConfig.textMultiplier * 3.5,
                color: Theme.of(context).primaryColor,
              ),
          helperText: "write the name who suggested this app",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget _appName(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70, -250),
      child: Text(
        "Shubh \n     Ratna",
        style: Theme.of(context).textTheme.bodyText2.copyWith(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scrollBuilder(context, referController),
    );
  }
}
