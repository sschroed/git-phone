//
//  git_phoneAppDelegate.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "git_phoneAppDelegate.h"
#import "RootViewController.h"
#import "ConnectivityController.h"
#import "ApplicationErrorViewController.h"
#import "LoginViewController.h"
#import "Models.h"

@interface git_phoneAppDelegate()
- (void) showError:(NSString *)errorMessage;
- (void) loadPreferences;
@end

@implementation git_phoneAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	
	// Ensure we have connectivity to GitHub.
	[[Config instance] setBaseURL:@"http://github.com"];
	if(![ConnectivityController isGitHubWebServiceReachable:[[Config instance] baseURL]]) {
		[self showError:@"Octocat cannot connect to GitHub."];
		return;
	} 
	
	[self loadPreferences];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

- (void) showError:(NSString *)errorMessage {
	ApplicationErrorViewController *errorController = [[ApplicationErrorViewController alloc] initWithNibName:@"ApplicationError" bundle:nil];
	[errorController setErrorMessage:errorMessage]; 
	[[self window] addSubview:errorController.view];
}

- (void) loadPreferences {	
	// read user prefs
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[[Config instance] setGitHubUserName:[defaults stringForKey:@"GitHubUserName"]];
	
	DevLog2(@"username: %@", [[Config instance] gitHubUserName]);
	
	// Check if username is set
	if ([[Config instance] gitHubUserName] == NULL) {
		LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"Login" bundle:nil] autorelease];
		[window addSubview:[loginViewController view]];
		[navigationController presentModalViewController:loginViewController animated:YES];
	} else {
		DevLog(@"NOT NULL");
	}
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
