import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wootricsdk_flutter_method_channel.dart';

abstract class WootricsdkFlutterPlatform extends PlatformInterface {
  /// Constructs a WootricsdkFlutterPlatform.
  WootricsdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static WootricsdkFlutterPlatform _instance = MethodChannelWootricsdkFlutter();

  /// The default instance of [WootricsdkFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelWootricsdkFlutter].
  static WootricsdkFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WootricsdkFlutterPlatform] when
  /// they register themselves.
  static set instance(WootricsdkFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  configure({required String clientId, required String accountToken}) {
    throw UnimplementedError('configure() has not been implemented.');
  }

  /// While [endUserEmail] is not required it is HIGHLY recommended to set it if possible.
  setEndUserEmail(String endUserEmail) {
    throw UnimplementedError('setEndUserEmail() has not been implemented.');
  }

  /// Set an [endUserExternalId] for the end user. This value is optional.
  setEndUserExternalId(String endUserExternalId) {

  }

  /// [endUserProperties] can be provided as an Map<String, String> object.
  setEndUserPropteries(Map<String, String> endUserProperties) {

  }

  /// If [forceSurvey] is set to true, the survey is displayed
  /// skipping eligibility check AND even if user was already surveyed.
  /// This is for test purposes only as it will display the survey every time and for every user.
  forceSurvey(bool forceSurvey) {

  }

  /// If [surveyImmediately] is set to true and user wasn’t surveyed yet -
  /// eligibility check will return true and survey will be displayed.
  surveyImmediately(bool surveyImmediately) {

  }

  /// When creating a new end user for survey, it will set the external creation date
  /// (so for example, date, when end user was created in your iOS application).
  /// This value is also used in eligibility check, to determine if end user should be surveyed.
  setEndUserCreatedAt(int timestamp) {

  }

  /// If not set, defaults to value from admin panel.
  /// Used to check if end user was created/last seen earlier than ago and therefore if survey is required.
  setFirstSurveyAfter(int numberOfDays) {

  }

  /// iOS relevant only: Right after a vote or dismiss we are setting a NSUserDefault
  /// that lasts for 90 days and indicates that end user was already surveyed on this device.
  /// We are doing this to lower the requests amount to our eligibility server.
  /// If your survey throttle is different than 90 days and/or you don’t want to set the surveyed “cookie”
  /// you can set this option [surveyedDefault] to false.
  setSurveyedDefault(bool surveyedDefault) {

  }

  /// If you enable this setting, score and feedback text will be added as wootric_score and wootric_text params
  /// to the “thank you” URL you have provided.
  passScoreAndTextToURL(bool passScoreAndTextToURL) {

  }

  /// With this option enabled, promoters (score 9-10) will be taken directly to third (social share) screen,
  /// skipping the second (feedback) one.
  skipFeedbackScreenForPromoter(bool skipFeedbackScreenForPromoter) {

  }

  /// If [showOptOut] is set to true, it will show an option for the end user
  /// to opt out of being surveyed. Default value is NO.
  showOptOut(bool showOptOut) {

  }

  /// Set WTRLogger level to None i.e. it won’t show any log from the WootricSDK.
  setLogLevelNone() {
  }

  /// Set WTRLogger level to Error i.e. it will only show error logs from the WootricSDK.
  setLogLevelError() {
  }

  /// Set WTRLogger level to Verbose i.e. it will show all logs from the WootricSDK.
  setLogLevelVerbose() {
  }

  /// Wootric allows you to set a custom language for the survey modal.
  /// To set a custom language pass appropriate [languageCode].
  /// Please be advised, that custom messages and/or placeholder, takes precedence over language settings.
  setLanguageCode(String languageCode) {

  }
  /// Display Wootric survey driven by configured settings.
  showSurvey() {

  }

  /// Display Wootric survey driven by configured settings and event name.
  showSurveyWithEvent(String eventName) {

  }

}
