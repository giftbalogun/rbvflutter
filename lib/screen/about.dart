// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbvflutter/screen/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn('4', Icons.call, 'Apps'),
        _buildButtonColumn('54', Icons.near_me, 'Webistes'),
        _buildButtonColumn('15', Icons.share, 'Assists'),
      ],
    );

    Widget socialmedia = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialmedia(Icons.mail, 'Mail', () {
          mail();
        }),
        _socialmedia(FontAwesomeIcons.instagram, 'Instagram', () {
          instagram();
        }),
        _socialmedia(FontAwesomeIcons.whatsapp, 'Whatsapp', () {
          whatsapp();
        }),
        _socialmedia(FontAwesomeIcons.telegram, 'Whatsapp', () {
          telegram();
        }),
        _socialmedia(Icons.call, 'Call', () {
          phone();
        }),
      ],
    );

    return Scaffold(
      backgroundColor: HexColor("A7762A"),
      body: ListView(children: [
        title,
        buttonSection,
        Divider(
          height: 30,
          thickness: 10,
          indent: 20,
          endIndent: 20,
          color: getColorFromHex('#000000'),
        ),
        socialmedia,
        Divider(
          height: 30,
          thickness: 10,
          indent: 20,
          endIndent: 20,
          color: getColorFromHex('#000000'),
        ),
        textSection,
        website,
      ]),
    );
  }

  Widget title = Container(
    padding: const EdgeInsets.all(15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100, //we give the image a radius of 50
                backgroundImage: AssetImage('images/logo.JPG'),
              ),
              Divider(
                height: 30,
                //thickness: 10,
                indent: 20,
                endIndent: 20,
                color: getColorFromHex('#CD9491'),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'Hey, am Balogun Gift',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Full Stack Web Developer/Full Stack Mobile App Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textSection = const Padding(
    padding: EdgeInsets.all(25),
    child: Text(
      'I am a Full Stack Web Developer and Full Stack Mobile App Developer, and'
      ' I enjoys learning new languages and frameworks.'
      'I am a problem solver with a bit touch of Critical Thinking and also '
      'improve total organizational productivity through various proactive approaches.',
      softWrap: true,
    ),
  );

  static getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  Widget website = Padding(
      //const String toLaunch = 'https://www.cylog.org/headers/',
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                //fixedSize: Size(240, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(fontSize: 20),
                //primary: Colors.blue,
                primary: getColorFromHex('#000000'),
                elevation: 2 // foreground
                ),
            onPressed: () {
              openurl();
            },
            child: const Text('Visit My Website'),
          ),
        ],
      ));

  Column _buildButtonColumn(String number, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(number),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: getColorFromHex('#000000'),
            ),
          ),
        ),
      ],
    );
  }

  _socialmedia(icon, label, onTap) {
    //padding: EdgeInsets.all(10);
    Color color = getColorFromHex('#000000');
    return GestureDetector(
      //padding: EdgeInsets.all(10),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void openurl() {
    String url1 = "https:giftbalogun.name.ng";
    launch(url1);
  }

  static void instagram() {
    String url1 = "https:instagram.com/am_thd_one";
    launch(url1);
  }

  static void whatsapp() {
    String url1 = "https:wa.link/uy8ac9";
    launch(url1);
  }

  static void telegram() {
    String url1 = "https:instagram.com/am_thd_one";
    launch(url1);
  }

  static void mail() {
    String url1 = "mailto:balogunigift@gmail.com";
    launch(url1);
  }

  static void phone() {
    String url1 = "tel:+2347061601790";
    launch(url1);
  }
}
