import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurantApp/config/responsive.dart';
import 'package:restaurantApp/providers/auth.dart';
import 'package:restaurantApp/screens/auth.dart';
import 'package:restaurantApp/themes/appTheme.dart';

import 'routers/router.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
  //run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Shubh Ratna',
              theme: AppTheme.lightTheme,
              home: StreamBuilder(
                stream: _auth.authStateChanges(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.hasData) {
                    return Home();
                  }
                  return Auth();
                },
              ),
              routes: routers,
            );
          });
        },
      ),
    );
  }
}
