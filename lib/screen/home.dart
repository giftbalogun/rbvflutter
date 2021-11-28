// ignore_for_file: unnecessary_null_comparison, unnecessary_new, prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rbvflutter/config/ad_config.dart';
import 'package:rbvflutter/widget/banner_ad.dart';
import 'package:rbvflutter/widget/drawer.dart';
import 'package:rbvflutter/widget/float.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<List> getCurrencies() async {
  String apiUrl = 'http://royalbv.giftbalogun.name.ng/api/currency';
  http.Response response = await http.get(Uri.parse(apiUrl));
  return json.decode(response.body)['data'];
}

class CryptoListWidget extends StatelessWidget {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
  final List _currencies;

  CryptoListWidget(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      drawer: NavDrawer(),
      body: _buildBody(),
      backgroundColor: HexColor("A7762A"),
      floatingActionButton: ExampleExpandableFab(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Current Market Rates',
        style: new TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Image.asset(
            'images/app_logo.png',
            height: 50,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: getCurrencies,
      backgroundColor: HexColor("A7762A"),
      color: Colors.white,
      displacement: 200,
      strokeWidth: 5,
      child: new Container(
        // A top margin of 56.0. A left and right margin of 8.0. And a bottom margin of 0.0.
        margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
        child: new Column(
          // A column widget can have several widgets that are placed in a top down fashion
          children: <Widget>[
            _getListViewWidget(),
            AdConfig.isAdsEnabled == true ? BannerAdWidget() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _getAppTitleWidget() {
    return new Text(
      'Current Market Rates',
      style: new TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
    );
  }

  Widget _getListViewWidget() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _currencies.length,
          itemBuilder: (context, index) {
            final Map currency = _currencies[index];
            final MaterialColor color = _colors[index % _colors.length];

            return _getListItemWidget(currency, color);
          }),
    );
  }

  CircleAvatar _getLeadingWidget(String currencyName, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      backgroundImage: NetworkImage(currencyName),
    );
  }

  Text _getTitleWidget(String currencyName) {
    return new Text(
      currencyName,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  RichText _getSubtitleText(String priceUsd, String percentChange1h) {
    TextSpan priceTextWidget = new TextSpan(
      text: "Buy at: \NGN $priceUsd\n",
      style: new TextStyle(color: Colors.blue),
    );
    String percentChangeText = "Sell at: NGN$percentChange1h";
    TextSpan percentChangeTextWidget;
    percentChangeTextWidget = new TextSpan(
      text: percentChangeText,
      style: new TextStyle(color: Colors.red),
    );

    return new RichText(
      text: new TextSpan(children: [priceTextWidget, percentChangeTextWidget]),
    );
  }

  final imageurl = "http://royalbv.giftbalogun.name.ng/assets/images/currency/";

  ListTile _getListTile(Map currency, MaterialColor color) {
    return new ListTile(
      leading: _getLeadingWidget(imageurl + currency['image'], color),
      title: _getTitleWidget(currency['name']),
      subtitle: _getSubtitleText(currency['sell_at'], currency['buy_at']),
      isThreeLine: true,
    );
  }

  Container _getListItemWidget(Map currency, MaterialColor color) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: _getListTile(currency, color),
      ),
    );
  }
}

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
