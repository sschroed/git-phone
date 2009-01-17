//
//  ApplicationErrorViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "ApplicationErrorViewController.h"


@implementation ApplicationErrorViewController
@synthesize errorMessageTextView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[errorMessageTextView setFont:[UIFont systemFontOfSize:12.0]];
	[errorMessageTextView setText:errorMessage == nil ? @"An unknown error has occurred." : errorMessage];
}

- (void) setErrorMessage:(NSString *)error {
	errorMessage = [error copy];
}

- (void)dealloc {
	[errorMessage release];
	[errorMessageTextView release];
    [super dealloc];
}

@end
