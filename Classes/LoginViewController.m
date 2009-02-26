//
//  LoginViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize userName;
@synthesize apiToken;
@synthesize systemPrefs;
@synthesize copyRight;
@synthesize rememberMe;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Setup UITextFields
	userName.font = [UIFont systemFontOfSize:16];
	apiToken.font = [UIFont systemFontOfSize:16];
	systemPrefs.font = [UIFont systemFontOfSize:13];
	copyRight.font = [UIFont systemFontOfSize:11];
  
  rememberMe.on = [[Config instance] gitHubUserName] && [[Config instance] gitHubToken];
}

- (void)viewDidAppear:(BOOL)flag {
	//[userName becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	if (textField == userName) {
		[textField resignFirstResponder];
		[apiToken becomeFirstResponder];
		return YES;
	} else if (textField == apiToken) {
		if (nil != textField.text && [textField.text length] > 0){
			[textField resignFirstResponder];
			return YES;
		} else {
			[self showAlert:@"Please enter your GitHub username & API Token" withTitle:@"Octocat FAIL"];
			return NO;
		}
	}
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if (textField == apiToken) {
		[[Config instance] setGitHubUserName:[userName text]];
		[[Config instance] setGitHubToken:[apiToken text]];
		if (![Connector didAuthenticateUser:[[Config instance] gitHubUserName] withToken:[[Config instance] gitHubToken]]) {
			[self showAlert:@"Unable to authenticate using the credentials you provided." withTitle:@"Octocat FAIL"];
			[userName becomeFirstResponder];
		} else {
      if (rememberMe.on) {
        [[Config instance] rememberCredentials];
      } else {
        [[Config instance] forgetCredentials];
      }
        
			[self dismissModalViewControllerAnimated:YES];
		}
	}
}

//TODO: Refactor out this method
- (void)showAlert:(NSString *)message withTitle:(NSString *)title {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title 
														message:message
													   delegate:nil 
											  cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)dealloc {
	[userName release];
	[apiToken release];
	[systemPrefs release];
	[copyRight release];
    [super dealloc];
}


@end
