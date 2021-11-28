// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rbvflutter/config/config.dart';
import 'package:rbvflutter/screen/about.dart';
import 'package:rbvflutter/screen/home.dart';
import 'package:rbvflutter/services/app_service.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Image(
                      height: 240,
                      width: 380,
                      fit: BoxFit.contain,
                      image: AssetImage(Config.logo)),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Our Website"),
            leading: IconButton(
              icon: const Icon(Icons.link_outlined),
              onPressed: () {
                Navigator.pop(context);
                AppService().openLinkWithCustomTab(context, Config.websiteUrl);
              },
            ),
            onTap: () {
              Navigator.pop(context);
              AppService().openLinkWithCustomTab(context, Config.websiteUrl);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("FaceBook Page"),
            leading: IconButton(
              icon: const Icon(Icons.link_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.pop(context);
              AppService().openLink(context, Config.facebookPageUrl);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Market Rates"),
            leading: IconButton(
              icon: const Icon(Icons.rate_review),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () async {
              List currencies = await getCurrencies();
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CryptoListWidget(currencies),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Contact Us"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            onTap: () => AppService().openEmailSupport(),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Developer"),
            leading: IconButton(
              icon: const Icon(Icons.contact_page),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Portfolio()));
            },
          )
        ],
      ),
    );
  }
}
