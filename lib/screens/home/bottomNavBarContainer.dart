import 'package:flutter/material.dart';
import 'package:travel_mate_mobile/screens/account/account.dart';
import 'package:travel_mate_mobile/screens/auth/login.dart';
import 'package:travel_mate_mobile/screens/home/home.dart';
import 'package:travel_mate_mobile/screens/pastTrips/pastTrips.dart';

class BottomNavigationContainer extends StatefulWidget {
  BottomNavigationContainer({Key key}) : super(key: key);

  @override
  _BottomNavigationContainerState createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    PastTripsPage(),
    AccountPage(),
    LoginPage(),
  ];

  onTapped(int newIndex) {
    setState(() {
      currentTabIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded), label: "Past Trips"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Profile")
        ],
      ),
    );
  }
}
