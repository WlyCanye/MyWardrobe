//
//  AppDelegate.m
//  MyWardrobe
//
//  Created by develop1 on 2017/5/15.
//  Copyright © 2017年 残夜孤鸥. All rights reserved.
//

#import "AppDelegate.h"
#import "MWEnterViewController.h"
#import "MWTabBarController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "MWClothesDispalySqlite.h"
@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.dataAry = [@[] mutableCopy];
    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirst"];
    
    // 先创建好8张表格，每个表格存储每个衣柜(抽屉)的衣服
    [MWClothesDispalySqlite creatTableName:@"clothes1"];
    [MWClothesDispalySqlite creatTableName:@"clothes2"];
    [MWClothesDispalySqlite creatTableName:@"clothes3"];
    [MWClothesDispalySqlite creatTableName:@"clothes4"];
    [MWClothesDispalySqlite creatTableName:@"clothes5"];
    
    [MWClothesDispalySqlite creatTableName:@"clothes6"];
    [MWClothesDispalySqlite creatTableName:@"clothes7"];
    [MWClothesDispalySqlite creatTableName:@"clothes8"];
    
    if (!isFirst) {
        MWEnterViewController *enterVc = [[MWEnterViewController alloc] init];
        self.window.rootViewController = enterVc;
 
        // 存一张死图
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"1.jpg"] toTable:@"clothes1"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"2.jpg"] toTable:@"clothes2"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"4.jpg"] toTable:@"clothes2"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"3.jpg"] toTable:@"clothes3"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"4.jpg"] toTable:@"clothes4"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"4.jpg"] toTable:@"clothes5"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"5.jpg"] toTable:@"clothes6"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"6.jpg"] toTable:@"clothes7"];
        [MWClothesDispalySqlite saveImage:[UIImage imageNamed:@"6.jpg"] toTable:@"clothes8"];
        
        
    } else {
        MWTabBarController *tabBarVc = [[MWTabBarController alloc] init];
        self.window.rootViewController = tabBarVc;
    }
    
    [self.window makeKeyAndVisible];
    
    
    
#pragma mark -- UM分享
    // 打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];

    // 设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@""];
    [self configUSharePlatforms];


    return YES;
}
#pragma mark -- 设置个平台appkey
- (void)configUSharePlatforms{
    [[UMSocialManager defaultManager] setPlaform:(UMSocialPlatformType_WechatSession) appKey:@"" appSecret:@"" redirectURL:@""];
    [[UMSocialManager defaultManager] setPlaform:(UMSocialPlatformType_QQ) appKey:@"" appSecret:@"" redirectURL:@""];
    [[UMSocialManager defaultManager] setPlaform:(UMSocialPlatformType_Sina) appKey:@"" appSecret:@"" redirectURL:@""];

}
#pragma mark -- 系统回调
- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {

    }
    return result;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {

    }
    return result;
}




#pragma mark -- 原始实现
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
