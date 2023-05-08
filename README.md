# Flutter Plugin for Wootric SDK

This is an official Wootric SDK Wrapper for Flutter by InMoment.

[Website](https://inmoment.com/wootric/)

[Official Documentation:](https://docs.wootric.com/)

## Example

1. Import wootricsdk_flutter
2. Init the library with your credentials
```
WootricsdkFlutter.configure(
  clientId: "<CLIENT_ID",
  accountToken: "<ACCOUNT_TOKEN>",
);    
     
```
3. Setup your survey properties

```
 WootricsdkFlutter.setEndUserEmail('test@example.com');
 WootricsdkFlutter.setEndUserExternalId('123456789');
 WootricsdkFlutter.setEndUserProperties({
    'App': 'My App'
 });
```

4. Presenting Survey

```
WootricsdkFlutter.forceSurvey(true); // Only for test
WootricsdkFlutter.showSurvey();          
```

5. Targeted Sampling

```
WootricsdkFlutter.showSurveyWithEvent("event_name");     
```

6. Color Customization (iPhone & Smartphones only)

```
    WootricsdkFlutter.setSliderColor("#FF0000");
    WootricsdkFlutter.setSendButtonBackgroundColor("#FF0000");
    WootricsdkFlutter.setThankYouButtonBackgroundColor("#FF0000");
    WootricsdkFlutter.setSocialSharingColor("#FF0000");  
```

## Logging

SDK Supports various types of logging,

```
WootricsdkFlutter.setLogLevelVerbose();
WootricsdkFlutter.setLogLevelError();
WootricsdkFlutter.setLogLevelNone();
```