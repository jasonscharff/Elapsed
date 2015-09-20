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
  
  [self addMyFakeDataSet];
  
  
  // Override point for customization after application launch.
  return YES;
}


-(void)addMyFakeDataSet {
  
  
  [[NSFileManager defaultManager] removeItemAtPath:[RLMRealmConfiguration defaultConfiguration].path error:nil];
  
  NSString *str;
  
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
  NSTimeZone *EST = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
  [formatter setTimeZone:EST];
  
  
  
  ClockInSheet *sheet1 = [[ClockInSheet alloc]init];
  str = @"9/01/2015 9:15 AM";
  sheet1.time = [formatter dateFromString:str];
  sheet1.isClockIn = YES;
  ClockInSheet *sheet2 = [[ClockInSheet alloc]init];
  str = @"9/01/2015 8:15 PM";
  sheet2.time = [formatter dateFromString:str];
  sheet2.isClockIn = NO;
  ClockInSheet *sheet3 = [[ClockInSheet alloc]init];
  str = @"9/02/2015 7:15 AM";
  sheet3.time = [formatter dateFromString:str];
  sheet3.isClockIn = YES;
  ClockInSheet *sheet4 = [[ClockInSheet alloc]init];
  str = @"9/02/2015 6:15 PM";
  sheet4.time = [formatter dateFromString:str];
  sheet4.isClockIn = NO;
  ClockInSheet *sheet5 = [[ClockInSheet alloc]init];
  str = @"9/03/2015 6:15 AM";
  sheet5.time = [formatter dateFromString:str];
  sheet5.isClockIn = YES;
  ClockInSheet *sheet6 = [[ClockInSheet alloc]init];
  str = @"9/03/2015 9:15 PM";
  sheet6.time = [formatter dateFromString:str];
  sheet6.isClockIn = NO;
  ClockInSheet *sheet7 = [[ClockInSheet alloc]init];
  str = @"9/04/2015 8:15 AM";
  sheet7.time = [formatter dateFromString:str];
  sheet7.isClockIn = YES;
  ClockInSheet *sheet8 = [[ClockInSheet alloc]init];
  str = @"9/04/2015 2:15 PM";
  sheet8.time = [formatter dateFromString:str];
  sheet8.isClockIn = NO;
  ClockInSheet *sheet9 = [[ClockInSheet alloc]init];
  str = @"9/05/2015 1:15 AM";
  sheet9.time = [formatter dateFromString:str];
  sheet9.isClockIn = YES;
  ClockInSheet *sheet10 = [[ClockInSheet alloc]init];
  str = @"9/05/2015 4:15 PM";
  sheet10.time = [formatter dateFromString:str];
  sheet10.isClockIn = NO;
  ClockInSheet *sheet11 = [[ClockInSheet alloc]init];
  str = @"9/06/2015 3:15 AM";
  sheet11.time = [formatter dateFromString:str];
  sheet11.isClockIn = YES;
  ClockInSheet *sheet12 = [[ClockInSheet alloc]init];
  str = @"9/06/2015 8:15 PM";
  sheet12.time = [formatter dateFromString:str];
  sheet12.isClockIn = NO;
  ClockInSheet *sheet13 = [[ClockInSheet alloc]init];
  str = @"9/07/2015 2:15 AM";
  sheet13.time = [formatter dateFromString:str];
  sheet13.isClockIn = YES;
  ClockInSheet *sheet14 = [[ClockInSheet alloc]init];
  str = @"9/07/2015 9:15 PM";
  sheet14.time = [formatter dateFromString:str];
  sheet14.isClockIn = NO;
  ClockInSheet *sheet15 = [[ClockInSheet alloc]init];
  str = @"9/08/2015 1:15 AM";
  sheet15.time = [formatter dateFromString:str];
  sheet15.isClockIn = YES;
  ClockInSheet *sheet16 = [[ClockInSheet alloc]init];
  str = @"9/08/2015 2:15 PM";
  sheet16.time = [formatter dateFromString:str];
  sheet16.isClockIn = NO;
  ClockInSheet *sheet17 = [[ClockInSheet alloc]init];
  str = @"9/09/2015 9:15 AM";
  sheet17.time = [formatter dateFromString:str];
  sheet17.isClockIn = YES;
  ClockInSheet *sheet18 = [[ClockInSheet alloc]init];
  str = @"9/09/2015 11:15 PM";
  sheet18.time = [formatter dateFromString:str];
  sheet18.isClockIn = NO;
  ClockInSheet *sheet19 = [[ClockInSheet alloc]init];
  str = @"9/10/2015 1:15 AM";
  sheet19.time = [formatter dateFromString:str];
  sheet19.isClockIn = YES;
  ClockInSheet *sheet20 = [[ClockInSheet alloc]init];
  str = @"9/10/2015 10:15 PM";
  sheet20.time = [formatter dateFromString:str];
  sheet20.isClockIn = NO;
  ClockInSheet *sheet21 = [[ClockInSheet alloc]init];
  str = @"9/11/2015 11:15 AM";
  sheet21.time = [formatter dateFromString:str];
  sheet21.isClockIn = YES;
  ClockInSheet *sheet22 = [[ClockInSheet alloc]init];
  str = @"9/11/2015 2:15 PM";
  sheet22.time = [formatter dateFromString:str];
  sheet22.isClockIn = NO;
  ClockInSheet *sheet23 = [[ClockInSheet alloc]init];
  str = @"9/12/2015 6:15 AM";
  sheet23.time = [formatter dateFromString:str];
  sheet23.isClockIn = YES;
  ClockInSheet *sheet24 = [[ClockInSheet alloc]init];
  str = @"9/12/2015 8:15 PM";
  sheet24.time = [formatter dateFromString:str];
  sheet24.isClockIn = NO;
  ClockInSheet *sheet25 = [[ClockInSheet alloc]init];
  str = @"9/13/2015 8:15 AM";
  sheet25.time = [formatter dateFromString:str];
  sheet25.isClockIn = YES;
  ClockInSheet *sheet26 = [[ClockInSheet alloc]init];
  str = @"9/13/2015 10:15 PM";
  sheet26.time = [formatter dateFromString:str];
  sheet26.isClockIn = NO;
  ClockInSheet *sheet27 = [[ClockInSheet alloc]init];
  str = @"9/14/2015 11:15 AM";
  sheet27.time = [formatter dateFromString:str];
  sheet27.isClockIn = YES;
  ClockInSheet *sheet28 = [[ClockInSheet alloc]init];
  str = @"9/14/2015 11:15 PM";
  sheet28.time = [formatter dateFromString:str];
  sheet28.isClockIn = NO;
  ClockInSheet *sheet29 = [[ClockInSheet alloc]init];
  str = @"9/15/2015 4:15 AM";
  sheet29.time = [formatter dateFromString:str];
  sheet29.isClockIn = YES;
  ClockInSheet *sheet30 = [[ClockInSheet alloc]init];
  str = @"9/15/2015 3:15 PM";
  sheet30.time = [formatter dateFromString:str];
  sheet30.isClockIn = NO;
  
  
  
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm transactionWithBlock:^{
    [realm addObject:sheet1];
    [realm addObject:sheet2];
    [realm addObject:sheet3];
    [realm addObject:sheet4];
    [realm addObject:sheet5];
    [realm addObject:sheet6];
    [realm addObject:sheet7];
    [realm addObject:sheet8];
    [realm addObject:sheet9];
    [realm addObject:sheet10];
    [realm addObject:sheet11];
    [realm addObject:sheet12];
    [realm addObject:sheet13];
    [realm addObject:sheet14];
    [realm addObject:sheet15];
    [realm addObject:sheet16];
    [realm addObject:sheet17];
    [realm addObject:sheet18];
    [realm addObject:sheet19];
    [realm addObject:sheet20];
    [realm addObject:sheet21];
    [realm addObject:sheet22];
    [realm addObject:sheet23];
    [realm addObject:sheet24];
    [realm addObject:sheet25];
    [realm addObject:sheet26];
    [realm addObject:sheet27];
    [realm addObject:sheet28];
    [realm addObject:sheet29];
    [realm addObject:sheet30];
  }];

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
