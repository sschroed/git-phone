//
//  ApplicationErrorViewController.h
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

@interface ApplicationErrorViewController : UIViewController {
	NSString *errorMessage;
	UITextView *errorMessageTextView;
}

@property (nonatomic, retain) IBOutlet UITextView *errorMessageTextView;

- (void) setErrorMessage:(NSString *)error;


@end
