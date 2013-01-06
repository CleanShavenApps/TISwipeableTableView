//
//  SwipeableExampleAppDelegate.h
//  SwipeableExample
//
//  Created by Tom Irving on 16/06/2010.
//  Copyright Tom Irving 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeableExampleAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow * window;
    UINavigationController * navigationController;
}

@property (nonatomic, strong) UIWindow * window;
@property (nonatomic, strong) UINavigationController * navigationController;

@end

