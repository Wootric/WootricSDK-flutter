import Flutter
import UIKit
import WootricSDK

public class SwiftWootricsdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "wootricsdk_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftWootricsdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
       switch call.method {
            case "getPlatformVersion":
                result("iOS " + UIDevice.current.systemVersion)

            case "configure":
                if let arguments = call.arguments as? [String: Any] {
                    let clientId = arguments["clientId"] as? String
                    let accountToken = arguments["accountToken"] as? String
                    Wootric.configure(withClientID: clientId, accountToken: accountToken)
                }

            case "setEndUserEmail":
                if let arguments = call.arguments as? [String: Any] {
                    let endUserEmail = arguments["endUserEmail"] as? String
                    Wootric.setEndUserEmail(endUserEmail)
                }

            case "setEndUserExternalId":
                if let arguments = call.arguments as? [String: Any] {
                    let endUserExternalId = arguments["endUserExternalId"] as? String
                    Wootric.setEndUserExternalId(endUserExternalId)
                }

            case "setEndUserProperties":
                if let arguments = call.arguments as? [String: Any] {
                    let properties = arguments["endUserProperties"] as? [String: Any]
                    Wootric.setEndUserProperties(properties)
                }

            case "forceSurvey":
                if let arguments = call.arguments as? [String: Any] {
                    let forceSurvey = arguments["forceSurvey"] as? Bool ?? false
                    Wootric.forceSurvey(forceSurvey)
                }

            case "surveyImmediately":
                if let arguments = call.arguments as? [String: Any] {
                    let surveyImmediately = arguments["surveyImmediately"] as? Bool ?? false
                    Wootric.surveyImmediately(surveyImmediately)
                }

            case "setEndUserCreatedAt":
                if let arguments = call.arguments as? [String: Any] {
                    let endUserCreatedAt = arguments["endUserCreatedAt"] as? NSNumber
                    Wootric.setEndUserCreatedAt(endUserCreatedAt)
                }

            case "setFirstSurveyAfter":
                if let arguments = call.arguments as? [String: Any] {
                    let numberOfDays = arguments["numberOfDays"] as? NSNumber
                    Wootric.setFirstSurveyAfter(numberOfDays)
                }

            case "setSurveyedDefault":
                if let arguments = call.arguments as? [String: Any] {
                    let surveyedDefault = arguments["surveyedDefault"] as? Bool ?? false
                    Wootric.setSurveyedDefault(surveyedDefault)
                }

            case "passScoreAndTextToURL":
                if let arguments = call.arguments as? [String: Any] {
                    let passScoreAndTextToURL = arguments["passScoreAndTextToURL"] as? Bool ?? false
                    Wootric.passScoreAndText(toURL: passScoreAndTextToURL)
                }

            case "skipFeedbackScreenForPromoter":
                if let arguments = call.arguments as? [String: Any] {
                    let skipFeedbackScreenForPromoter = arguments["skipFeedbackScreenForPromoter"] as? Bool ?? false
                    Wootric.skipFeedbackScreen(forPromoter: skipFeedbackScreenForPromoter)
                }

            case "showOptOut":
                if let arguments = call.arguments as? [String: Any] {
                    let showOptOut = arguments["showOptOut"] as? Bool ?? false
                    Wootric.showOptOut(showOptOut)
                }

            case "setLogLevelNone":
                Wootric.setLogLevelNone()

            case "setLogLevelError":
                Wootric.setLogLevelError()

            case "setLogLevelVerbose":
                Wootric.setLogLevelVerbose()

            case "setLanguageCode":
                if let arguments = call.arguments as? [String: Any] {
                    let languageCode = arguments["languageCode"] as? String
                    Wootric.setCustomLanguage(languageCode)
                }

            case "showWootricSurvey":
                if let window = UIApplication.shared.delegate?.window {
                    let viewController = window?.rootViewController
                    Wootric.showSurvey(in: viewController)
                }

            case "showWootricSurveyWithEvent":
                if let window = UIApplication.shared.delegate?.window {
                    if let arguments = call.arguments as? [String: Any] {
                        let eventName = arguments["eventName"] as? String
                        let viewController = window?.rootViewController
                        Wootric.showSurvey(in: viewController, event: eventName)
                    }
                }

            default:
                result(FlutterMethodNotImplemented)
            }
    }
}
