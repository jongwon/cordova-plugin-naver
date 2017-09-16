#import "AppDelegate.h"

@interface AppDelegate (naver)
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
- (BOOL)handleWithUrl:(NSURL *)url;
@end
