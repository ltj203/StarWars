//
//  StarWarsAppDelegate.m
//  StarWars
//
//  Created by Lisa Jenkins on 11/23/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "StarWarsAppDelegate.h"
#import "View.h"

@implementation StarWarsAppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
    view = [[View alloc] initWithFrame:screen.applicationFrame];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window addSubview:view];
    [self.window makeKeyAndVisible];
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"Could not get the main bundle");
        return YES;
    }
    
    NSString *path = [bundle pathForResource:@"starwars" ofType:@"mp3"];
    if (path == nil) {
        NSLog(@"could not get the path");
        return YES;
    }
    
    NSURL *url = [NSURL fileURLWithPath:path isDirectory:NO];
    NSError *error = nil;
    NSData *songFile = [[NSData alloc] initWithContentsOfURL:url];
    player = [[AVAudioPlayer alloc] initWithData:songFile error:&error];
    if (player == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    player.volume = 5.0;
    player.numberOfLoops = 0;
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    
    if (![player play]) {
        NSLog(@"could not play");
    }
    
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
}

@end
