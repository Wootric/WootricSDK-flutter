package com.inmoment.wootricsdk_flutter

import android.app.Activity
import android.graphics.Color
import androidx.annotation.NonNull
import android.net.Uri;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.wootric.androidsdk.Wootric
import com.wootric.androidsdk.objects.WootricCustomThankYou
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** WootricsdkFlutterPlugin */
class WootricsdkFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Activity
  private var wootric: Wootric? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wootricsdk_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE)
    } else if (call.method.equals("configure")) {
      val clientId: String? = call.argument("clientId")
      val accountToken: String? = call.argument("accountToken")
      wootric = Wootric.init(context, clientId, accountToken)
    } else if (call.method.equals("setEndUserEmail")) {
      val endUserEmail: String? = call.argument("endUserEmail")
      wootric?.setEndUserEmail(endUserEmail)
    } else if (call.method.equals("setEndUserExternalId")) {
      val endUserExternalId: String? = call.argument("endUserExternalId")
      wootric?.setEndUserExternalId(endUserExternalId)
    } else if (call.method.equals("setEndUserProperties")) {
      wootric?.setProperties(call.argument("endUserProperties") as HashMap<String?, String?>?)
    } else if (call.method.equals("surveyImmediately")) {
      val surveyImmediately: Boolean? = call.argument("surveyImmediately")
      val value = surveyImmediately ?: false
      wootric?.setSurveyImmediately(value)
    } else if (call.method.equals("forceSurvey")) {
      val forceSurvey: Boolean? = call.argument("forceSurvey")
      val value = forceSurvey ?: false
      wootric?.setSurveyImmediately(value)
    } else if (call.method.equals("setEndUserCreatedAt")) {
      val endUserCreatedAt: Int? = call.argument("endUserCreatedAt")
      if (endUserCreatedAt != null) {
        wootric?.setEndUserCreatedAt(endUserCreatedAt.toLong())
      }
    } else if (call.method.equals("setFirstSurveyAfter")) {
      val numberOfDays: Int? = call.argument("numberOfDays")
      if (numberOfDays != null) {
        wootric?.setFirstSurveyDelay(numberOfDays)
      }
    } else if (call.method.equals("passScoreAndTextToURL")) {
      val passScoreAndTextToURL: Boolean? = call.argument("passScoreAndTextToURL")
      val passScoreAndUrl = passScoreAndTextToURL ?: false
      val customThankYou = WootricCustomThankYou()
      customThankYou.setScoreInUrl(passScoreAndUrl)
      customThankYou.setCommentInUrl(passScoreAndUrl)
      wootric?.setCustomThankYou(customThankYou)
    } else if (call.method.equals("showOptOut")) {
      val showOptOut: Boolean? = call.argument("showOptOut")
      val showoptout = showOptOut ?: false
      wootric?.setShowOptOut(showoptout)
    } else if (call.method.equals("skipFeedbackScreenForPromoter")) {
      val skipFeedbackScreenForPromoter: Boolean? = call.argument("skipFeedbackScreenForPromoter")
      val skipFeedbackSceen = skipFeedbackScreenForPromoter ?: false
      wootric?.shouldSkipFollowupScreenForPromoters(skipFeedbackSceen)
    } else if (call.method.equals("setLanguageCode")) {
      val languageCode: String? = call.argument("languageCode")
      wootric?.setLanguageCode(languageCode)
    } else if (call.method.equals("setSliderColor")) {
      val hexColor: String? = call.argument("color")
      val color: Int = Color.parseColor(hexColor)
      wootric?.setScoreColor(color)
    } else if (call.method.equals("setSendButtonBackgroundColor")) {
      val hexColor: String? = call.argument("color")
      val color: Int = Color.parseColor(hexColor)
      wootric?.setSurveyColor(color)
    } else if (call.method.equals("setThankYouButtonBackgroundColor")) {
      val hexColor: String? = call.argument("color")
      val color: Int = Color.parseColor(hexColor)
      wootric?.setThankYouButtonBackgroundColor(color)
    } else if (call.method.equals("setSocialSharingColor")) {
      val hexColor: String? = call.argument("color")
      val color: Int = Color.parseColor(hexColor)
      wootric?.setSocialSharingColor(color)
    } else if (call.method.equals("showWootricSurvey")) {
      wootric?.survey()
    } else if (call.method.equals("showWootricSurveyWithEvent")) {
      val eventName: String? = call.argument("eventName")
      wootric?.survey(eventName)
    } else if (call.method.equals("showDisclaimer")) {
      val disclaimerText: String? = call.argument("disclaimerText")
      val disclaimerLink: String? = call.argument("disclaimerLinkURL")
      val disclaimerLinkText: String? = call.argument("disclaimerLinkText")
      val disclaimerLinkURI = Uri.parse(disclaimerLink)
      wootric?.showDisclaimer(disclaimerText, disclaimerLinkURI, disclaimerLinkText)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onDetachedFromActivity() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    context = binding.activity
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    context = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {}
}
