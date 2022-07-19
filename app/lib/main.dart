import 'package:app/components/camera_input.dart';
import 'package:app/screens/auth/register.dart';
import 'package:app/screens/guest.dart';
import 'package:app/screens/authenticated.dart';
import 'package:app/screens/main/haircuts.dart';
import 'package:app/utils/routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarberShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      initialRoute: '/guest',
      routes: {
        Routes.guestScreen: (context) => Guest(),
        Routes.authenticatedScreen: (context) => Authenticated(),
        Routes.registerScreen: (context) => Register(),
        Routes.haircutListScreen: (context) => Haircuts(),
      },
    );
  }
}
