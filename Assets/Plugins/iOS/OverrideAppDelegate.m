#import "UnityAppController.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@interface OverrideAppDelegate : UnityAppController
@end

IMPL_APP_CONTROLLER_SUBCLASS(OverrideAppDelegate)

@implementation OverrideAppDelegate

// Override to UnityAppController.mm
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
                                       sourceApplication:(NSString *)sourceApplication
                                              annotation:(id)annotation {
    // [super application:application openURL:url sourceApplication:sourceApplication annotation:annotation];

    if ([KOSession isKakaoAccountLoginCallback:url]) {
        return [KOSession handleOpenURL:url];
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
                                                 options:(NSDictionary<NSString *,id> *)options {
    // [super application:application openURL:url options:options];
    
    if ([KOSession isKakaoAccountLoginCallback:url]) {
        return [KOSession handleOpenURL:url];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [super applicationDidBecomeActive:application];
    
    [KOSession handleDidBecomeActive];
}


@end
