//
//  StarWarsAppDelegate.h
//  StarWars
//
//  Created by Lisa Jenkins on 11/23/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class View;

@interface StarWarsAppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    UIWindow *_window;
    AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;

@end
