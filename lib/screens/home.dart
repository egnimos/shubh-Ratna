import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurantApp/screens/profile.dart';
import 'package:restaurantApp/screens/timeline.dart';
import 'package:restaurantApp/themes/colorsTheme.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = [
    Timeline(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation);
        },
        child: Container(
          key: ValueKey<int>(_selectedIndex),
          child: _widgets[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        showElevation: true,
        backgroundColor: ColorsTheme.backgroundColor,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          // _pageController.animateToPage(page, duration: null, curve: null)
        }),
        items: [
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.home,
              color: ColorsTheme.dp08Color,
            ),
            title: Text(
              "home",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorsTheme.dp08Color,
                  ),
            ),
            activeColor: Colors.grey.shade600,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.person,
              color: ColorsTheme.dp08Color,
            ),
            title: Text(
              "profile",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsTheme.dp08Color,
                  ),
            ),
            activeColor: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}
