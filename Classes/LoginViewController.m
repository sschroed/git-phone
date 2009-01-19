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
@synthesize systemPrefs;
@synthesize copyRight;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Setup UITextFields
	userName.font = [UIFont systemFontOfSize:16];
	systemPrefs.font = [UIFont systemFontOfSize:11];
	copyRight.font = [UIFont systemFontOfSize:11];
}

- (void)viewDidAppear:(BOOL)flag {
	[userName becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	if (nil != textField.text && [textField.text length] > 0){
		[[Config instance] setGitHubUserName:[textField text]];
		[textField resignFirstResponder];
		return YES;
	} else {
		[self showAlert:@"Please enter your GitHub username" withTitle:@"Octocat FAIL"];
		return NO;
	}
	
	
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	[self dismissModalViewControllerAnimated:YES];
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
	[userName release];
    [super dealloc];
}


@end
