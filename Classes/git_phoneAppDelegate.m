//
//  git_phoneAppDelegate.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "git_phoneAppDelegate.h"
#import "RootViewController.h"
#import "Models.h"


@implementation git_phoneAppDelegate

@synthesize window;
@synthesize navigationController;

- (void) loadPreferencess {	
	// read user prefs
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[[Config instance] setGitHubUserName:[defaults stringForKey:@"GitHubUserName"]];
	
	DevLog2(@"username: %@", [[Config instance] gitHubUserName]);
	
	// Check if username is set
	if ([[Config instance] gitHubUserName] == NULL) {
		DevLog(@"NULL");
	} else {
		DevLog(@"NOT NULL");
	}
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	
	[self loadPreferencess];
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
