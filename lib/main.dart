// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rbvflutter/screen/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> _messageHandler(RemoteMessage message) async {}

void main() async {
  List currencies = await getCurrencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  MobileAds.instance.initialize();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RBV Market',
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset('images/1024.png', width: 1024, height: 440),
        nextScreen: CryptoListWidget(currencies),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.white,
      ),
    ),
  );
}
