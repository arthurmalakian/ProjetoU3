import 'dart:convert';

import 'package:app/models/user.dart';
import 'package:app/screens/main/parlors.dart';
import 'package:app/screens/main/rate_us.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class Guest extends StatefulWidget {
  @override
  _Guest createState() => _Guest();
}

class _Guest extends State<Guest> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  PageController _pageController = PageController(initialPage: 0);

  final _navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.cut),
      label: 'Barbearias',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Nos Avalie!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Super Barber"), actions: [
        IconButton(
          icon: const Icon(Icons.app_registration),
          tooltip: 'Registro',
          onPressed: () {
            Navigator.of(context).pushNamed(
              Routes.registerScreen,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.login),
          tooltip: 'Login',
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext) {
                  String email = '';
                  String password = '';
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Login para Barbeiros'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (text) {
                                email = text.toString();
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                                icon: Icon(Icons.password),
                              ),
                              obscureText: true,
                              onChanged: (text) {
                                password = text.toString();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            var response = await User.login(email, password);
                            if (response['code'] == 200) {
                              User user = User(
                                  id: response['data']['user']['id'],
                                  name: response['data']['user']['name'],
                                  email: response['data']['user']['email'],
                                  token: response['data']['token']);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.authenticatedScreen,
                                ModalRoute.withName("/"),
                                arguments: response['data']['token'],
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Icon(Icons.login))
                    ],
                  );
                });
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
