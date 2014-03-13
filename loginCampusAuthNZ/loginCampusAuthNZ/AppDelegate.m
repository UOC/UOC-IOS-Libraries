//
//  AppDelegate.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  // Definim una macro per a poder escollir colors amb hexadecimal

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UINavigationBar appearance]setBarTintColor:UIColorFromRGB(0x007AFF)]; // Definim que el color de la barra de navegacio sigui un blau
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]]; // Definim que el color de les lletres de navegacio siguin blanques. No els titols de les vistes
    [[UINavigationBar appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                         [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, nil]]; // Definim els colors dels titols com a blanc. Aqui s'hi poden afegir mes atributs com sombres, mida de la lletra, tipus de font...
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if([stdDefaults objectForKey:@"registrada"]){
        if([stdDefaults objectForKey:@"secret"]==FALSE){
            [stdDefaults removeObjectForKey:@"registrada"];
        }
        NSLog(@"applicationWillTerminate");
    }
}

@end
