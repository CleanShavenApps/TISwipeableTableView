//
//  SwipeableExampleAppDelegate.m
//  SwipeableExample
//
//  Created by Tom Irving on 16/06/2010.
//  Copyright Tom Irving 2010. All rights reserved.
//

#import "SwipeableExampleAppDelegate.h"
#import "RootViewController.h"


@implementation SwipeableExampleAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch   
	
	// Obviously I never do anything like this, but it's quick for the example.
	[self setWindow:[[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]];
	[self setNavigationController:[[[UINavigationController alloc] initWithRootViewController:[[[RootViewController alloc] initWithStyle:UITableViewStylePlain] autorelease]] autorelease]];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end
