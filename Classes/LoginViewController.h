//
//  LoginViewController.h
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *userName;
	IBOutlet UITextField *apiToken;
	IBOutlet UILabel *systemPrefs;
	IBOutlet UILabel *copyRight;
}

@property(nonatomic, retain) UITextField *userName;
@property(nonatomic, retain) UITextField *apiToken;
@property(nonatomic, retain) UILabel *systemPrefs;
@property(nonatomic, retain) UILabel *copyRight;

- (void)showAlert:(NSString *)message withTitle:(NSString *)title;

@end
