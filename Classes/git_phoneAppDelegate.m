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
	[self authenticate];
	
	//LOAD MAIN APP
	[Repository loadAll];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

- (void) showError:(NSString *)errorMessage {
	ApplicationErrorViewController *errorController = [[ApplicationErrorViewController alloc] initWithNibName:@"ApplicationError" bundle:nil];
	[errorController setErrorMessage:errorMessage]; 
	[[self window] addSubview:errorController.view];
}

- (void) loadLoginView {
	LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"Login" bundle:nil] autorelease];
	[window addSubview:[loginViewController view]];
	[navigationController presentModalViewController:loginViewController animated:YES];

}
- (void) authenticate {
	// Check if username is set
	if ([[Config instance] gitHubUserName] == NULL || [[Config instance] gitHubToken] == NULL) {
		[self loadLoginView];
	} else {
		if (![Connector didAuthenticateUser:[[Config instance] gitHubUserName] withToken:[[Config instance] gitHubToken]]) {
			[self showAlert:@"Unable to auto-authenticate using the credentials saved in your settings." withTitle:@"Octocat FAIL"];
			[self loadLoginView];
		}
	}
}

- (void) loadPreferences {	
	// read user prefs
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[[Config instance] setGitHubUserName:[defaults stringForKey:@"GitHubUserName"]];
	[[Config instance] setGitHubToken:[defaults stringForKey:@"GitHubToken"]];
	
	DevLog2(@"username: %@", [[Config instance] gitHubUserName]);
}

- (void)showAlert:(NSString *)message withTitle:(NSString *)title {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title 
														message:message
													   delegate:nil 
											  cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
