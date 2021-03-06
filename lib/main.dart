import 'package:doctor_companion/pages/home_page.dart';
import 'package:doctor_companion/pages/login/login_page.dart';
import 'package:doctor_companion/pages/login/register.dart';
import 'package:flutter/material.dart';

import 'Screens/appointmentScreen/appointmentScreen.dart';


void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new AppointmentScreen(),

//  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Sqflite App',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}
