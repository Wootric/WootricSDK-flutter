import 'wootricsdk_flutter_platform_interface.dart';

class WootricsdkFlutter {
  Future<String?> getPlatformVersion() {
    return WootricsdkFlutterPlatform.instance.getPlatformVersion();
  }

  static configure({required String clientId, required String accountToken}) {
    WootricsdkFlutterPlatform.instance
        .configure(clientId: clientId, accountToken: accountToken);
  }

  /// While [endUserEmail] is not required it is HIGHLY recommended to set it if possible.
  static setEndUserEmail(String endUserEmail) {
    WootricsdkFlutterPlatform.instance.setEndUserEmail(endUserEmail);
  }

  /// Set an [endUserExternalId] for the end user. This value is optional.
  static setEndUserExternalId(String endUserExternalId) {
    WootricsdkFlutterPlatform.instance.setEndUserExternalId(endUserExternalId);
  }

  /// [endUserProperties] can be provided as an Map<String, String> object.
  static setEndUserPropteries(Map<String, String> endUserProperties) {
    WootricsdkFlutterPlatform.instance.setEndUserPropteries(endUserProperties);
  }

  /// If [forceSurvey] is set to true, the survey is displayed
  /// skipping eligibility check AND even if user was already surveyed.
  /// This is for test purposes only as it will display the survey every time and for every user.
  static forceSurvey(bool forceSurvey) {
    WootricsdkFlutterPlatform.instance.forceSurvey(forceSurvey);
  }

  /// If [surveyImmediately] is set to true and user wasn’t surveyed yet -
  /// eligibility check will return true and survey will be displayed.
  static surveyImmediately(bool surveyImmediately) {
    WootricsdkFlutterPlatform.instance.surveyImmediately(surveyImmediately);
  }

  /// When creating a new end user for survey, it will set the external creation date
  /// (so for example, date, when end user was created in your iOS application).
  /// This value is also used in eligibility check, to determine if end user should be surveyed.
  static setEndUserCreatedAt(int timestamp) {
    WootricsdkFlutterPlatform.instance.setEndUserCreatedAt(timestamp);
  }

  /// If not set, defaults to value from admin panel.
  /// Used to check if end user was created/last seen earlier than ago and therefore if survey is required.
  static setFirstSurveyAfter(int numberOfDays) {
    WootricsdkFlutterPlatform.instance.setFirstSurveyAfter(numberOfDays);
  }

  /// iOS relevant only: Right after a vote or dismiss we are setting a NSUserDefault
  /// that lasts for 90 days and indicates that end user was already surveyed on this device.
  /// We are doing this to lower the requests amount to our eligibility server.
  /// If your survey throttle is different than 90 days and/or you don’t want to set the surveyed “cookie”
  /// you can set this option [surveyedDefault] to false.
  static setSurveyedDefault(bool surveyedDefault) {
    WootricsdkFlutterPlatform.instance.setSurveyedDefault(surveyedDefault);
  }

  /// If you enable this setting, score and feedback text will be added as wootric_score and wootric_text params
  /// to the “thank you” URL you have provided.
  static passScoreAndTextToURL(bool passScoreAndTextToURL) {
    WootricsdkFlutterPlatform.instance
        .passScoreAndTextToURL(passScoreAndTextToURL);
  }

  /// With this option enabled, promoters (score 9-10) will be taken directly to third (social share) screen,
  /// skipping the second (feedback) one.
  static skipFeedbackScreenForPromoter(bool skipFeedbackScreenForPromoter) {
    WootricsdkFlutterPlatform.instance
        .skipFeedbackScreenForPromoter(skipFeedbackScreenForPromoter);
  }

  /// If [showOptOut] is set to true, it will show an option for the end user
  /// to opt out of being surveyed. Default value is NO.
  static showOptOut(bool showOptOut) {
    WootricsdkFlutterPlatform.instance.showOptOut(showOptOut);
  }

  /// Set WTRLogger level to None i.e. it won’t show any log from the WootricSDK.
  static setLogLevelNone() {
    WootricsdkFlutterPlatform.instance.setLogLevelNone();
  }

  /// Set WTRLogger level to Error i.e. it will only show error logs from the WootricSDK.
  static setLogLevelError() {
    WootricsdkFlutterPlatform.instance.setLogLevelError();
  }

  /// Set WTRLogger level to Verbose i.e. it will show all logs from the WootricSDK.
  static setLogLevelVerbose() {
    WootricsdkFlutterPlatform.instance.setLogLevelVerbose();
  }

  /// Wootric allows you to set a custom language for the survey modal.
  /// To set a custom language pass appropriate [languageCode].
  /// Please be advised, that custom messages and/or placeholder, takes precedence over language settings.
  static setLanguageCode(String languageCode) {
    WootricsdkFlutterPlatform.instance.setLanguageCode(languageCode);
  }

  /// Display Wootric survey driven by configured settings.
  static showSurvey() {
    WootricsdkFlutterPlatform.instance.showSurvey();
  }

  /// Display Wootric survey driven by configured settings and event name.
  static showSurveyWithEvent(String eventName) {
    WootricsdkFlutterPlatform.instance.showSurveyWithEvent(eventName);
  }
}
