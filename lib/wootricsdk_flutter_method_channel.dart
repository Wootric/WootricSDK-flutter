import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wootricsdk_flutter_platform_interface.dart';

/// An implementation of [WootricsdkFlutterPlatform] that uses method channels.
class MethodChannelWootricsdkFlutter extends WootricsdkFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wootricsdk_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  configure({required String clientId, required String accountToken}) {
    methodChannel.invokeMethod('configure', {
      "clientId": clientId,
      "accountToken": accountToken,
    });
  }

  /// While [endUserEmail] is not required it is HIGHLY recommended to set it if possible.
  @override
  setEndUserEmail(String endUserEmail) {
    methodChannel
        .invokeMethod('setEndUserEmail', {'endUserEmail': endUserEmail});
  }

  @override
  setEndUserExternalId(String endUserExternalId) {
    methodChannel.invokeMethod(
        'setEndUserExternalId', {'endUserExternalId': endUserExternalId});
  }

  /// [endUserProperties] can be provided as an Map<String, String> object.
  @override
  setEndUserProperties(Map<String, String> endUserProperties) {
    methodChannel.invokeMethod('setEndUserProperties', {
      'endUserProperties': endUserProperties,
    });
  }

  /// If [forceSurvey] is set to true, the survey is displayed
  /// skipping eligibility check AND even if user was already surveyed.
  /// This is for test purposes only as it will display the survey every time and for every user.
  @override
  forceSurvey(bool forceSurvey) {
    methodChannel.invokeMethod('forceSurvey', {
      'forceSurvey': forceSurvey,
    });
  }

  /// If [surveyImmediately] is set to true and user wasn’t surveyed yet -
  /// eligibility check will return true and survey will be displayed.
  @override
  surveyImmediately(bool surveyImmediately) {
    methodChannel.invokeMethod('surveyImmediately', {
      'surveyImmediately': surveyImmediately,
    });
  }

  /// When creating a new end user for survey, it will set the external creation date
  /// (so for example, date, when end user was created in your iOS application).
  /// This value is also used in eligibility check, to determine if end user should be surveyed.
  @override
  setEndUserCreatedAt(int timestamp) {
    methodChannel.invokeMethod('setEndUserCreatedAt', {
      'endUserCreatedAt': timestamp,
    });
  }

  /// If not set, defaults to value from admin panel.
  /// Used to check if end user was created/last seen earlier than ago and therefore if survey is required.
  @override
  setFirstSurveyAfter(int numberOfDays) {
    methodChannel.invokeMethod('setFirstSurveyAfter', {
      'numberOfDays': numberOfDays,
    });
  }

  /// iOS relevant only: Right after a vote or dismiss we are setting a NSUserDefault
  /// that lasts for 90 days and indicates that end user was already surveyed on this device.
  /// We are doing this to lower the requests amount to our eligibility server.
  /// If your survey throttle is different than 90 days and/or you don’t want to set the surveyed “cookie”
  /// you can set this option [surveyedDefault] to false.
  @override
  setSurveyedDefault(bool surveyedDefault) {
    methodChannel.invokeMethod('setSurveyedDefault', {
      'surveyedDefault': surveyedDefault,
    });
  }

  /// If you enable this setting, score and feedback text will be added as wootric_score and wootric_text params
  /// to the “thank you” URL you have provided.
  @override
  passScoreAndTextToURL(bool passScoreAndTextToURL) {
    methodChannel.invokeMethod('passScoreAndTextToURL', {
      'passScoreAndTextToURL': passScoreAndTextToURL,
    });
  }

  /// With this option enabled, promoters (score 9-10) will be taken directly to third (social share) screen,
  /// skipping the second (feedback) one.
  @override
  skipFeedbackScreenForPromoter(bool skipFeedbackScreenForPromoter) {
    methodChannel.invokeMethod('skipFeedbackScreenForPromoter', {
      'skipFeedbackScreenForPromoter': skipFeedbackScreenForPromoter,
    });
  }

  /// If [showOptOut] is set to true, it will show an option for the end user
  /// to opt out of being surveyed. Default value is NO.
  @override
  showOptOut(bool showOptOut) {
    methodChannel.invokeMethod('showOptOut', {
      'showOptOut': showOptOut,
    });
  }

  /// Set WTRLogger level to None i.e. it won’t show any log from the WootricSDK.
  @override
  setLogLevelNone() {
    methodChannel.invokeMethod('setLogLevelNone');
  }

  /// Set WTRLogger level to Error i.e. it will only show error logs from the WootricSDK.
  @override
  setLogLevelError() {
    methodChannel.invokeMethod('setLogLevelError');
  }

  /// Set WTRLogger level to Verbose i.e. it will show all logs from the WootricSDK.
  @override
  setLogLevelVerbose() {
    methodChannel.invokeMethod('setLogLevelVerbose');
  }

  /// Wootric allows you to set a custom language for the survey modal.
  /// To set a custom language pass appropriate [languageCode].
  /// Please be advised, that custom messages and/or placeholder, takes precedence over language settings.
  @override
  setLanguageCode(String languageCode) {
    methodChannel.invokeMethod('setLanguageCode', {
      'languageCode': languageCode,
    });
  }

  /// Wootric allows you to set a custom color for the survey slider.
  /// To set a custom color pass appropriate [color] in hex format.
  @override
  setSliderColor(String color) {
    methodChannel.invokeMethod('setSliderColor', {
      'color': color,
    });
  }

  /// Wootric allows you to set a custom color for the Send button.
  /// To set a custom color pass appropriate [color] in hex format.
  @override
  setSendButtonBackgroundColor(String color) {
    methodChannel.invokeMethod('setSendButtonBackgroundColor', {
      'color': color,
    });
  }

  /// Wootric allows you to set a custom color for the Thank You button.
  /// To set a custom color pass appropriate [color] in hex format.
  @override
  setThankYouButtonBackgroundColor(String color) {
    methodChannel.invokeMethod('setThankYouButtonBackgroundColor', {
      'color': color,
    });
  }

  /// Wootric allows you to set a custom color for social sharing buttons.
  /// To set a custom color pass appropriate [color] in hex format.
  @override
  setSocialSharingColor(String color) {
    methodChannel.invokeMethod('setSocialSharingColor', {
      'color': color,
    });
  }

  @override
  showSurvey() {
    methodChannel.invokeMethod('showWootricSurvey');
  }

  @override
  showSurveyWithEvent(String eventName) {
    methodChannel
        .invokeMethod('showWootricSurveyWithEvent', {'eventName': eventName});
  }
}
