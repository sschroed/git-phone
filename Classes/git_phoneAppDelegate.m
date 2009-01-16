//
//  git_phoneAppDelegate.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "git_phoneAppDelegate.h"
#import "RootViewController.h"


@implementation git_phoneAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
