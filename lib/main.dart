// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rbvflutter/screen/home.dart';

Future<void> _messageHandler(RemoteMessage message) async {}

void main() async {
  List currencies = await getCurrencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

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
