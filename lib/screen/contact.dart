import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rbvflutter/screen/home.dart';
import 'package:rbvflutter/widget/float.dart';
import 'package:http/http.dart' as http;
import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class ContactePage extends StatefulWidget {
  const ContactePage({Key? key}) : super(key: key);

  @override
  State<ContactePage> createState() => _ContactePageState();
}

class _ContactePageState extends State<ContactePage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();

  late BannerAd bannerAd;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-5537701541019565/6267193824",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
          print("Banner Ad Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          isLoaded = false;
          print('Failed to load a banner ad: ${error.message}');
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  clearTextInput() {
    controllerName.clear();
    controllerEmail.clear();
    controllerMessage.clear();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("A7762A"),
      floatingActionButton: const ExampleExpandableFab(),
      body: _buildBody(),
    );
  }

  Future sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      clearTextInput;
      const serviceId = 'service_q4m8sbb';
      const templateId = 'template_wi06xxc';
      const userId = 'user_XQhjftlS9v3UQlrAxq4WU';

      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': name,
            'reply_to': email,
            'message': message,
          },
        }),
      );
      clearTextInput();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message Sent')),
      );
    }
  }

  Widget _buildBody() {
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5.0, 86.0, 8.0, 0.0),
          child: Center(
            //padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Leave A Message',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: controllerName,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: 'Fullname',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Your Fullname is required';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Your Email is required';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: controllerMessage,
                        maxLines: 7,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          labelText: 'Message',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Your Message is required';
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                      const SizedBox(height: 8.0),
                      MaterialButton(
                        onPressed: () {
                          sendEmail(
                            name: controllerName.text,
                            email: controllerEmail.text,
                            message: controllerMessage.text,
                          );
                        },
                        height: 60.0,
                        minWidth: double.infinity,
                        color: Colors.white,
                        child: const Text(
                          "Press to Leave Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                isLoaded
                    ? Container(
                        height: bannerAd.size.height.toDouble(),
                        width: bannerAd.size.width.toDouble(),
                        child: AdWidget(
                          ad: bannerAd,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
