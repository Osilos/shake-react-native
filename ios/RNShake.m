#import "RNShake.h"
#import <React/RCTUIManager.h>
#import <Shake/Shake.h>
#import <Shake/SHKShakeConfiguration.h>
#import <Shake/SHKShakeFile.h>
#import <Shake/SHKShakeReportData.h>

@implementation RNShake

+(void) initialize {
    if(self == [RNShake class]) {
        NSDictionary *platformAndSdkVersionDict = @{
            @"platform": @"ReactNative",
            @"sdkVersion": @"14.1.0"
        };
        NSNumber *disableDueToRN = @YES;
        [SHKShake performSelector:sel_getUid(@"_setNetworkRequestReporterDisabledDueToRN:".UTF8String) withObject:disableDueToRN];
        [SHKShake performSelector:sel_getUid(@"_setPlatformAndSDKVersion:".UTF8String) withObject:platformAndSdkVersionDict];
    }
}

+(BOOL)requiresMainQueueSetup
{
	return YES;
}

-(dispatch_queue_t)methodQueue
{
	return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(start, clientId:(NSString*)clientId clientSecret:(NSString*)clientSecret)
{
    [SHKShake startWithClientId:clientId clientSecret:clientSecret];
}

RCT_EXPORT_METHOD(show)
{
    [SHKShake show];
}

RCT_EXPORT_METHOD(setEnabled:(BOOL)enabled)
{
    SHKShake.isPaused = !enabled;
}

RCT_EXPORT_METHOD(setEnableActivityHistory:(BOOL)enableActivityHistory)
{
    SHKShake.configuration.isActivityHistoryEnabled = enableActivityHistory;
}

RCT_REMAP_METHOD(isEnableActivityHistory, isEnableActivityHistorywithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isActivityHistoryEnabled = [NSNumber numberWithBool:SHKShake.configuration.isActivityHistoryEnabled];
    resolve(isActivityHistoryEnabled);
}

RCT_EXPORT_METHOD(setEnableBlackBox:(BOOL)enableBlackBox)
{
    SHKShake.configuration.isBlackBoxEnabled = enableBlackBox;
}

RCT_REMAP_METHOD(isEnableBlackBox, isEnableBlackBoxwithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isEnableBlackBox = [NSNumber numberWithBool:SHKShake.configuration.isBlackBoxEnabled];
    resolve(isEnableBlackBox);
}

RCT_EXPORT_METHOD(setEnableInspectScreen:(BOOL)enableInspectScreen)
{
    SHKShake.configuration.isInspectScreenEnabled = enableInspectScreen;
}

RCT_REMAP_METHOD(isEnableInspectScreen, isEnableInspectScreenwithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isEnableInspectScreen = [NSNumber numberWithBool:SHKShake.configuration.isInspectScreenEnabled];
    resolve(isEnableInspectScreen);
}

RCT_EXPORT_METHOD(setShowFloatingReportButton:(BOOL)showFloatingReportButton)
{
    SHKShake.configuration.isFloatingReportButtonShown = showFloatingReportButton;
}

RCT_REMAP_METHOD(isShowFloatingReportButton, isShowFloatingReportButtonwithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isShowFloatingReportButton = [NSNumber numberWithBool:SHKShake.configuration.isFloatingReportButtonShown];
    resolve(isShowFloatingReportButton);
}

RCT_EXPORT_METHOD(setInvokeShakeOnShakeDeviceEvent:(BOOL)invokeOnShake)
{
    SHKShake.configuration.isInvokedByShakeDeviceEvent = invokeOnShake;
}

RCT_REMAP_METHOD(isInvokeShakeOnShakeDeviceEvent, isInvokeShakeOnShakeDeviceEventwithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isInvokeShakeOnShakeDeviceEvent = [NSNumber numberWithBool:SHKShake.configuration.isInvokedByShakeDeviceEvent];
    resolve(isInvokeShakeOnShakeDeviceEvent);
}

RCT_EXPORT_METHOD(setInvokeShakeOnScreenshot:(BOOL)invokeOnScreenshot)
{
    SHKShake.configuration.isInvokedByScreenshot = invokeOnScreenshot;
}

RCT_REMAP_METHOD(isInvokeShakeOnScreenshot, withResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isInvokeOnScreenshot = [NSNumber numberWithBool:SHKShake.configuration.isInvokedByScreenshot];
    resolve(isInvokeOnScreenshot);
}

RCT_EXPORT_METHOD(setInvokeShakeOnRightEdgePan:(BOOL)invokeByRightEdgePan)
{
    SHKShake.configuration.isInvokedByRightEdgePan = invokeByRightEdgePan;
}

RCT_EXPORT_METHOD(isInvokeShakeOnRightEdgePan:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isInvokeByRightEdgePan = [NSNumber numberWithBool:SHKShake.configuration.isInvokedByRightEdgePan];
    resolve(isInvokeByRightEdgePan);
}

RCT_EXPORT_METHOD(setEnableEmailField:(BOOL)isEmailFieldEnabled)
{
    SHKShake.configuration.isEmailFieldEnabled = isEmailFieldEnabled;
}

RCT_EXPORT_METHOD(isEnableEmailField:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isEmailFieldEnabled = [NSNumber numberWithBool:SHKShake.configuration.isEmailFieldEnabled];
    resolve(isEmailFieldEnabled);
}

RCT_EXPORT_METHOD(setEmailField:(NSString*)emailField)
{
    SHKShake.configuration.emailField = emailField;
}

RCT_EXPORT_METHOD(getEmailField:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSString *emailField = SHKShake.configuration.emailField;
    resolve(emailField);
}

RCT_EXPORT_METHOD(setEnableMultipleFeedbackTypes:(BOOL)isFeedbackTypeEnabled)
{
    SHKShake.configuration.isFeedbackTypeEnabled = isFeedbackTypeEnabled;
}

RCT_EXPORT_METHOD(isEnableMultipleFeedbackTypes:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isFeedbackTypeEnabled = [NSNumber numberWithBool:SHKShake.configuration.isFeedbackTypeEnabled];
    resolve(isFeedbackTypeEnabled);
}

RCT_EXPORT_METHOD(setShowIntroMessage:(BOOL)showIntroMessage)
{
    SHKShake.configuration.setShowIntroMessage = showIntroMessage;
}

RCT_EXPORT_METHOD(getShowIntroMessage:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *showIntroMessage = [NSNumber numberWithBool:SHKShake.configuration.setShowIntroMessage];
    resolve(showIntroMessage);
}

RCT_EXPORT_METHOD(setAutoVideoRecording:(BOOL)isAutoVideoRecordingEnabled)
{
    SHKShake.configuration.isAutoVideoRecordingEnabled = isAutoVideoRecordingEnabled;
}

RCT_EXPORT_METHOD(isAutoVideoRecording:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isAutoVideoRecordingEnabled = [NSNumber numberWithBool:SHKShake.configuration.isAutoVideoRecordingEnabled];
    resolve(isAutoVideoRecordingEnabled);
}

RCT_EXPORT_METHOD(setConsoleLogsEnabled:(BOOL)isConsoleLogsEnabled)
{
    SHKShake.configuration.isConsoleLogsEnabled = isConsoleLogsEnabled;
}

RCT_EXPORT_METHOD(isConsoleLogsEnabled:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isConsoleLogsEnabled = [NSNumber numberWithBool:SHKShake.configuration.isConsoleLogsEnabled];
    resolve(isConsoleLogsEnabled);
}

RCT_EXPORT_METHOD(setMetadata:(NSString*)key:(NSString*)value)
{
    [SHKShake setMetadataWithKey: key value: value];
}

RCT_EXPORT_METHOD(log:(NSDictionary*)logLevelDic:(NSString*)message)
{
    LogLevel logLevel;
    
    NSString* value = [logLevelDic objectForKey:@"value"];
    if ([value isEqualToString:@"VERBOSE"])
        logLevel = LogLevelVerbose;
    if ([value isEqualToString:@"DEBUG"])
        logLevel = LogLevelDebug;
    if ([value isEqualToString:@"INFO"])
        logLevel = LogLevelInfo;
    if ([value isEqualToString:@"WARN"])
        logLevel = LogLevelWarn;
    if ([value isEqualToString:@"ERROR"])
        logLevel = LogLevelError;

    [SHKShake logWithLevel:logLevel message:message];
}

RCT_EXPORT_METHOD(setShakeReportData:(nonnull NSArray *)files)
{
    NSMutableArray <SHKShakeFile *> *shakeFiles = [NSMutableArray array];
    for(int i = 0; i < [files count]; i++) {
        NSDictionary *file = [files objectAtIndex:i];
        NSString *path = [file objectForKey:@"path"];
        NSString *name = [file objectForKey:@"name"];

        NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
        SHKShakeFile *attachedFile = [[SHKShakeFile alloc] initWithName:name andFileURL:url];

        [shakeFiles addObject:attachedFile];
    }

    SHKShake.onPrepareReportData = ^SHKShakeReportData *_Nonnull(SHKShakeReportData *_Nonnull reportData) {
      reportData.attachedFiles = [NSArray arrayWithArray:shakeFiles];
      return reportData;
    };
}

RCT_EXPORT_METHOD(silentReport:(nonnull NSString *)description:(nonnull NSArray *)files:(nonnull NSDictionary *)configurationMap)
{
    BOOL includesBlackBoxData = [[configurationMap objectForKey:@"blackBoxData"] boolValue];
    BOOL includesActivityHistoryData = [[configurationMap objectForKey:@"activityHistoryData"] boolValue];
    BOOL includesScreenshotImage = [[configurationMap objectForKey:@"screenshot"] boolValue];
    BOOL showsToastMessageOnSend = [[configurationMap objectForKey:@"showReportSentMessage"] boolValue];

    SHKShakeReportConfiguration *reportConfiguration = [[SHKShakeReportConfiguration alloc] init];
    reportConfiguration.includesBlackBoxData = includesBlackBoxData;
    reportConfiguration.includesActivityHistoryData = includesActivityHistoryData;
    reportConfiguration.includesScreenshotImage = includesScreenshotImage;
    reportConfiguration.showsToastMessageOnSend = showsToastMessageOnSend;

    NSMutableArray <SHKShakeFile *> *shakeFiles = [NSMutableArray array];
    for(int i = 0; i < [files count]; i++) {
        NSDictionary *file = [files objectAtIndex:i];
        NSString *path = [file objectForKey:@"path"];
        NSString *name = [file objectForKey:@"name"];

        NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
        SHKShakeFile *attachedFile = [[SHKShakeFile alloc] initWithName:name andFileURL:url];

        [shakeFiles addObject:attachedFile];
      }

    SHKShakeReportData *reportData = [[SHKShakeReportData alloc] init];
    reportData.bugDescription = description;
    reportData.attachedFiles = [NSArray arrayWithArray:shakeFiles];

    [SHKShake silentReportWithReportData:reportData reportConfiguration:reportConfiguration];
}

RCT_EXPORT_METHOD(insertNetworkRequest:(NSDictionary*)request)
{
    NSDictionary *dict = [[NSDictionary alloc] init];
    NSData *data = [request[@"requestBody"] dataUsingEncoding:NSUTF8StringEncoding];
    dict = @{
        @"url": request[@"url"],
        @"method": request[@"method"],
        @"responseBody": request[@"responseBody"],
        @"statusCode": request[@"statusCode"],
        @"requestBody": data,
        @"requestHeaders": request[@"requestHeaders"],
        @"duration": request[@"duration"],
        @"responseHeaders": request[@"responseHeaders"],
        @"timestamp": request[@"timestamp"]
    };
    [SHKShake performSelector:sel_getUid(@"_reportRequestCompleted:".UTF8String) withObject:dict];
}

RCT_EXPORT_METHOD(addPrivateView:(nonnull NSNumber*)tag)
{
    UIView* view = [self.bridge.uiManager viewForReactTag:tag];
    [SHKShake addPrivateView:view];
}

RCT_EXPORT_METHOD(removePrivateView:(nonnull NSNumber*)tag) {
    UIView* view = [self.bridge.uiManager viewForReactTag:tag];
    [SHKShake removePrivateView:view];
}

RCT_EXPORT_METHOD(clearPrivateViews) {
    [SHKShake clearPrivateViews];
}

RCT_EXPORT_METHOD(setSensitiveDataRedactionEnabled:(BOOL)isSensitiveDataRedactionEnabled)
{
    SHKShake.configuration.isSensitiveDataRedactionEnabled = isSensitiveDataRedactionEnabled;
}

RCT_EXPORT_METHOD(isSensitiveDataRedactionEnabled:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    NSNumber *isSensitiveDataRedactionEnabled = [NSNumber numberWithBool:SHKShake.configuration.isSensitiveDataRedactionEnabled];
    resolve(isSensitiveDataRedactionEnabled);
}

@end
