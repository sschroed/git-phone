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
	IBOutlet UILabel *makeRight;
  IBOutlet UISwitch *rememberMe;
}

@property(nonatomic, strong) UITextField *userName;
@property(nonatomic, strong) UITextField *apiToken;
@property(nonatomic, strong) UILabel *systemPrefs;
@property(nonatomic, strong) UILabel *makeRight;
@property(nonatomic, strong) UISwitch *rememberMe;

- (void)showAlert:(NSString *)message withTitle:(NSString *)title;

@end
