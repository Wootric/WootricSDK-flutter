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
 WootricsdkFlutter.setEndUserPropteries({
    'App': 'My App'
 });
```

4. Presenting Survey

```
WootricsdkFlutter.forceSurvey(true); // Only for test
WootricsdkFlutter.showSurvey();          
```

## Logging

SDK Supports various types of logging,

```
WootricsdkFlutter.setLogLevelVerbose();
WootricsdkFlutter.setLogLevelError();
WootricsdkFlutter.setLogLevelNone();
```