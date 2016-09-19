//
//  AppDelegate.m
//  Aidapei
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"
#import "DiscoverViewController.h"
#import "ZhidemaiViewController.h"
#import "MeidaViewController.h"

#import "DataBase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController =[self showTabbar];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(UITabBarController *)showTabbar
{
    UITabBarController *tabbar=[[UITabBarController alloc]init];
    
    MyViewController *my=[MyViewController new];
    my.tabBarItem.image=[UIImage imageNamed:@"tab_04"];
    my.tabBarItem.selectedImage=[UIImage imageNamed:@"tab_04_c"];;
    UINavigationController *myNav=[[UINavigationController alloc]initWithRootViewController:my];
    
    DiscoverViewController *discover=[DiscoverViewController new];
    discover.tabBarItem.image=[UIImage imageNamed:@"tab_03"];
    discover.tabBarItem.selectedImage=[UIImage imageNamed:@"tab_03_c"];
    UINavigationController *discoverNav=[[UINavigationController alloc]initWithRootViewController:discover];
    
    ZhidemaiViewController *zhidemai=[ZhidemaiViewController new];
    zhidemai.tabBarItem.image=[UIImage imageNamed:@"tab_02"];
    zhidemai.tabBarItem.selectedImage=[UIImage imageNamed:@"tab_02_c"];
    UINavigationController *zhidemaiNav=[[UINavigationController alloc]initWithRootViewController:zhidemai];
    
    MeidaViewController *meida=[MeidaViewController new];
    meida.tabBarItem.image=[UIImage imageNamed:@"tab_01"];
    meida.tabBarItem.selectedImage=[UIImage imageNamed:@"tab_01_c"];
    UINavigationController *meidaNav=[[UINavigationController alloc]initWithRootViewController:meida];
    
    tabbar.viewControllers=@[meidaNav,zhidemaiNav,discoverNav,myNav];
    
    return tabbar;
}

@end




















