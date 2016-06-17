//
//  AppDelegate.m
//  TIMChat
//
//  Created by AlexiChen on 16/1/29.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "AppDelegate.h"

#import <TencentOpenAPI/TencentOAuth.h>

#import "WXApi.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)configAppLaunch
{
//    // 作App配置
//    [super configAppLaunch];
//    
//    
//    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setBarTintColor:RGBA(0x0, 0xEE, 0xEE, 0)];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    
//    UIColor *highlightColor = RGBA(0x12, 0xa8, 0x6b, 1.0f);
//    UIColor *normalColor = [UIColor colorWithWhite:0.3f alpha:1.f];
//    
//    NSDictionary *selectedTextAttr = @{NSForegroundColorAttributeName: highlightColor, NSFontAttributeName: [UIFont systemFontOfSize:10.f]};;
//    NSDictionary *normalTextAttr = @{NSForegroundColorAttributeName: normalColor, NSFontAttributeName: [UIFont systemFontOfSize:10.f]};;
//
//    [[UITabBarItem appearance] setTitleTextAttributes:selectedTextAttr forState:UIControlStateSelected];
//    [[UITabBarItem appearance] setTitleTextAttributes:normalTextAttr forState:UIControlStateNormal];
    
    [[NSClassFromString(@"UICalloutBarButton") appearance] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 
}




- (void)enterMainUI
{
    self.window.rootViewController = [[TIMTabBarController alloc] init];
}

+ (instancetype)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (void)pushToChatViewControllerWith:(IMAUser *)user
{
    
    TIMTabBarController *tab = (TIMTabBarController *)self.window.rootViewController;
    [tab pushToChatViewControllerWith:user];
}


@end
