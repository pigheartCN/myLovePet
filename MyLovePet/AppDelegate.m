//
//  AppDelegate.m
//  MyLovePet
//
//  Created by zhuxin on 2018/5/18.
//  Copyright © 2018年 zhuxin. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"
#import "MessageViewController.h"
#import "PersonalViewController.h"
#import "PetTabBarViewController.h"

#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //融云IM
    [[RCIM sharedRCIM] initWithAppKey:@"0vnjpoad06ttz"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *identifierForVendor = [[[UIDevice currentDevice].identifierForVendor UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSMutableDictionary *paraDic = [NSMutableDictionary new];
    [paraDic setObject:identifierForVendor forKey:@"userId"];
    [paraDic setObject:@"testPig" forKey:@"name"];
    [paraDic setObject:@"" forKey:@"portraitUri"];
    
    [manager POST:@"http://api.cn.ronghub.com/user/getToken.json" parameters:paraDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *resultDic = (NSDictionary *)responseObject;
        NSLog(@"resultDic:%@",resultDic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败了哦！！！");
    }];
//    [[RCIM sharedRCIM] connectWithToken:@"YourTestUserToken"     success:^(NSString *userId) {
//        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
//    } error:^(RCConnectErrorCode status) {
//        NSLog(@"登陆的错误码为:%ld", (long)status);
//    } tokenIncorrect:^{
//        //token过期或者不正确。
//        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
//        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
//        NSLog(@"token错误");
//    }];
    //配置tabbar
    [self configNavigationTabbar];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 设置navigation & tabbar
- (void)configNavigationTabbar{
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    
    UINavigationController *shopNav = [[UINavigationController alloc] initWithRootViewController:[ShoppingViewController new]];
    
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:[MessageViewController new]];
    
    UINavigationController *personalNav = [[UINavigationController alloc] initWithRootViewController:[PersonalViewController new]];
    //占位用的
    UINavigationController *homeNav1 = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    
    PetTabBarViewController *tabBarVC = [[PetTabBarViewController alloc] init];
    tabBarVC.viewControllers = @[homeNav,shopNav,homeNav1,messageNav,personalNav];
    tabBarVC.selectedIndex = 0;
    self.window.rootViewController = tabBarVC;
}







@end
