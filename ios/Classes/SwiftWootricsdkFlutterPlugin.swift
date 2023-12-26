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

            case "setSliderColor":
                if let arguments = call.arguments as? [String: Any],
                   let hexColor = arguments["color"] as? String {
                    if let color = convertHEXtoUIColor(hexColor) {
                        Wootric.setSliderColor(color)
                    }
                }

            case "setSendButtonBackgroundColor":
                if let arguments = call.arguments as? [String: Any],
                   let hexColor = arguments["color"] as? String {
                    if let color = convertHEXtoUIColor(hexColor) {
                        Wootric.setSendButtonBackgroundColor(color)
                    }
                }

            case "setThankYouButtonBackgroundColor":
                if let arguments = call.arguments as? [String: Any],
                   let hexColor = arguments["color"] as? String {
                    if let color = convertHEXtoUIColor(hexColor) {
                        Wootric.setThankYouButtonBackgroundColor(color)
                    }
                }

            case "setSocialSharingColor":
                if let arguments = call.arguments as? [String: Any],
                   let hexColor = arguments["color"] as? String {
                    if let color = convertHEXtoUIColor(hexColor) {
                        Wootric.setSocialSharing(color)
                    }
                }

            case "showDisclaimer":
                if let arguments = call.arguments as? [String: Any] {
                    let disclaimerText = arguments["disclaimerText"] as? String
                    let disclaimerLink = arguments["disclaimerLinkURL"] as? String
                    let disclaimerLinkText = arguments["disclaimerLinkText"] as? String
                    let disclaimerLinkURL = URL(string: disclaimerLink!)
                    Wootric.showDisclaimerText(disclaimerText, link: disclaimerLinkURL, linkText: disclaimerLinkText)
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

    private func convertHEXtoUIColor(_ hex: String) -> UIColor? {
      let r, g, b, a: CGFloat

      if hex.hasPrefix("#") {
        let start = hex.index(hex.startIndex, offsetBy: 1)
        var hexColor = String(hex[start...])
        if hexColor.count == 6 {
          hexColor = hexColor + "FF"
        }

        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                let color = UIColor.init(red: r, green: g, blue: b, alpha: a)
                return color
            }
        }
      }

      return nil
    }
}
