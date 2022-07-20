import 'package:flutter_test/flutter_test.dart';
import 'package:wootricsdk_flutter/wootricsdk_flutter.dart';
import 'package:wootricsdk_flutter/wootricsdk_flutter_platform_interface.dart';
import 'package:wootricsdk_flutter/wootricsdk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWootricsdkFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements WootricsdkFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  configure({required String clientId, required String accountToken}) {

  }

  @override
  setEndUserEmail(String endUserEmail) {
  }

  @override
  setEndUserExternalId(String endUserExternalId) {
  }

  @override
  forceSurvey(bool forceSurvey) {

  }

  @override
  passScoreAndTextToURL(bool passScoreAndTextToURL) {

  }

  @override
  setEndUserCreatedAt(int timestamp) {

  }

  @override
  setEndUserPropteries(Map<String, String> endUserProperties) {

  }

  @override
  setFirstSurveyAfter(int numberOfDays) {

  }

  @override
  setLanguageCode(String languageCode) {

  }

  @override
  setLogLevelError() {

  }

  @override
  setLogLevelNone() {

  }

  @override
  setLogLevelVerbose() {

  }

  @override
  setSurveyedDefault(bool surveyedDefault) {

  }

  @override
  showOptOut(bool showOptOut) {

  }

  @override
  showSurvey() {

  }

  @override
  skipFeedbackScreenForPromoter(bool skipFeedbackScreenForPromoter) {

  }

  @override
  surveyImmediately(bool surveyImmediately) {

  }
}

void main() {
  final WootricsdkFlutterPlatform initialPlatform = WootricsdkFlutterPlatform.instance;

  test('$MethodChannelWootricsdkFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWootricsdkFlutter>());
  });

  test('getPlatformVersion', () async {
    WootricsdkFlutter wootricsdkFlutterPlugin = WootricsdkFlutter();
    MockWootricsdkFlutterPlatform fakePlatform = MockWootricsdkFlutterPlatform();
    WootricsdkFlutterPlatform.instance = fakePlatform;
  
    expect(await wootricsdkFlutterPlugin.getPlatformVersion(), '42');
  });
}
