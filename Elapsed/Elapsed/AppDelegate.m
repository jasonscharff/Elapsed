//
//  AppDelegate.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "AppDelegate.h"

#import <SupportKit/SupportKit.h>

#import "Elapsed-Swift.h"
#import "ViewController.h"
#import "LoginViewController.h"

#import <Realm/Realm.h>
#import "ClockInSheet.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  
  [SupportKit initWithSettings:
   [SKTSettings settingsWithAppToken:@"9w0n9myh44hwvnrjiofvjfoi6"]];
  
  
  self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  UINavigationController *navController=[[UINavigationController alloc] init];
 // ViewController *firstController=[[ViewController alloc] init];
  LoginViewController *firstController = [[LoginViewController alloc]init];
  [navController pushViewController:firstController animated:NO];
  _window.rootViewController = navController;
  [_window makeKeyAndVisible];
  navController.navigationBar.barTintColor = [[UIColor alloc]initWithRed:190 green:144 blue:212];
  
  UIColor *textColor = [[UIColor alloc]initWithRed:74 green:74 blue:74];
  navController.navigationBar.tintColor = textColor;
  
  [[UINavigationBar appearance] setTitleTextAttributes:
   [NSDictionary dictionaryWithObjectsAndKeys:
    textColor, NSForegroundColorAttributeName,
    [UIFont fontWithName:@"HelveticaNeue-Thin" size:24.0], NSFontAttributeName,nil]];
  
  
  
//  ClockInSheet *sheet = [[ClockInSheet alloc]init];
//  sheet.time = [NSDate date];
//  sheet.isClockIn = YES;
//  
//  
//  
//  RLMRealm *realm = [RLMRealm defaultRealm];
//  [realm transactionWithBlock:^{
//    [realm addObject:sheet];
//  }];
  
  // Override point for customization after application launch.
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    if ([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusAvailable) {
        
        NSLog(@"Background updates are available for the app.");
    }else if([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusDenied)
    {
        NSLog(@"The user explicitly disabled background behavior for this app or for the whole system.");
    }else if([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusRestricted)
    {
        NSLog(@"Background updates are unavailable and the user cannot enable them again. For example, this status can occur when parental controls are in effect for the current user.");
    }
    
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
