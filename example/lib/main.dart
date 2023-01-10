import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wootricsdk_flutter/wootricsdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _wootricsdkFlutterPlugin = WootricsdkFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _wootricsdkFlutterPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Present Survey'),
            onPressed: () {
              WootricsdkFlutter.configure(clientId: '<ClinetId>', accountToken: '<AccountToken>');
              WootricsdkFlutter.setEndUserEmail('abc@test.com');
              WootricsdkFlutter.forceSurvey(true); // For debug
              WootricsdkFlutter.setEndUserPropteries({'App': 'WootricPlugin'});
              WootricsdkFlutter.setSliderColor("#FF0000");
              WootricsdkFlutter.setSendButtonBackgroundColor("#FF0000");
              WootricsdkFlutter.setThankYouButtonBackgroundColor("#FF0000");
              WootricsdkFlutter.setSocialSharingColor("#FF0000");
              WootricsdkFlutter.showSurvey();
              WootricsdkFlutter.setLogLevelVerbose();
            },
          ),
        ),
      ),
    );
  }
}
