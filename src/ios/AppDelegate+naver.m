#import "AppDelegate+naver.h"
#import "NaverThirdPartyLoginConnection.h"

#define NAVER_APP_SCHEME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NaverAppScheme"]

@implementation AppDelegate (naver)

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [self handleWithUrl:url];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
  return [self handleWithUrl:url];
}
#endif

- (BOOL)handleWithUrl:(NSURL *)url {
  if ([[url scheme] isEqualToString:NAVER_APP_SCHEME]) {
    if ([[url host] isEqualToString:kCheckResultPage]) {
            
      // 네이버앱으로부터 전달받은 url값을 NaverThirdPartyLoginConnection의 인스턴스에 전달
      NaverThirdPartyLoginConnection *thirdConnection = [NaverThirdPartyLoginConnection getSharedInstance];
      THIRDPARTYLOGIN_RECEIVE_TYPE resultType = [thirdConnection receiveAccessToken:url];
            
      if (SUCCESS == resultType) {
        NSLog(@"Getting auth code from NaverApp success!");
      } else {
        // 앱에서 resultType에 따라 실패 처리한다.
      }
    }
    return YES;
  }
  
  return NO;
}
@end