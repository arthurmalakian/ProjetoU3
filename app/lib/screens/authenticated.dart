import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:app/screens/main/parlors.dart';
import 'package:app/screens/main/rate_us.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class Authenticated extends StatefulWidget {
  @override
  _Authenticated createState() => _Authenticated();
}

class _Authenticated extends State<Authenticated> {
  int _selectedIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.cut),
      label: 'Barbearias',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.cut),
    //   label: 'Minha barbearia',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Nos Avalie!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)!.settings.arguments as String;
    print(token);
    return Scaffold(
      appBar: AppBar(title: Text("Super Barber"), actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () async {
            var response = await User.logout(token);
            if (response['code'] == 200) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.guestScreen,
                ModalRoute.withName("/"),
              );
            } else {
              final snackBar = SnackBar(
                content: Text(response['message']),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ]),
      backgroundColor: Colors.lightGreen,
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: [
            Parlors(),
            RateUs(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _navigationItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
