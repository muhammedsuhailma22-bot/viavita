import 'package:flutter/material.dart';
import 'package:pawfect_match/providers/addtaskproviders.dart';
import 'package:pawfect_match/providers/bookingsprovider.dart';
import 'package:pawfect_match/providers/categoryprovider.dart';
import 'package:pawfect_match/providers/custprofileproviders.dart';
import 'package:pawfect_match/providers/edittasksproviders.dart';
import 'package:pawfect_match/providers/resetpassprovider.dart';
import 'package:pawfect_match/providers/reviewprovider.dart';
import 'package:pawfect_match/providers/taskproviders.dart';
import 'package:provider/provider.dart';

import 'package:pawfect_match/screens/splash_screen1.dart';

import 'package:pawfect_match/providers/signupprovider.dart';
import 'package:pawfect_match/providers/loginprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupProvider()),

        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ForgotProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => EditTaskProvider()),
        ChangeNotifierProvider(create: (_) => AddTaskProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => EstimateProvider()),

        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(fontFamily: 'Poppins'),

      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),

      home: const SplashScreen(),
    );
  }
}
