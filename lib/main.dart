// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rbvflutter/screen/home.dart';

void main() async {
  List currencies = await getCurrencies();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RBV Currency Rates',
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: 'images/ic_launcher.png',
        nextScreen: CryptoListWidget(currencies),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.white,
      ),
    ),
  );
}
