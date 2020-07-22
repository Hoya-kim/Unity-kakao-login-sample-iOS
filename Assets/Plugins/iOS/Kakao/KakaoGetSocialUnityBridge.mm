// #include "KakaoGetSocialBridgeUtils.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

extern "C" {
    void _sendKakaoLogin()
    {
        // Close old session
        if ( ! [[KOSession sharedSession] isOpen] ) {
            NSLog(@"in isOpen condition");
            [[KOSession sharedSession] close];
            NSLog(@"Old session closed");
        }

        // session open with completion handler
        [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"login failed. - error: %@", error);
            }
            else {
                NSLog(@"login succeeded.");
            }
            
            // get user info
            [KOSessionTask userMeTaskWithCompletion:^(NSError * _Nullable error, KOUserMe * _Nullable me) {
                if (error){
                    NSLog(@"get user info failed. - error: %@", error);
                } else {
                    NSLog(@"get user info. - user info: %@", me);
                }
            }];
        }];
    }

    void _sendKakaoLogout()
    {
        [[KOSession sharedSession] logoutAndCloseWithCompletionHandler:^(BOOL success, NSError *error) {
            if (error) {
                NSLog(@"failed to logout. - error: %@", error);
            }
            else {
                NSLog(@"logout succeeded.");
            }
        }];
    }
}
