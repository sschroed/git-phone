//
//  git_phoneAppDelegate.h
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface git_phoneAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UINavigationController *navigationController;

- (void)authenticate;
- (void)showAlert:(NSString *)message withTitle:(NSString *)title;

@end

