//
//  RepositoriesViewController.h
//  git-phone
//
//  Created by Sam Schroeder on 1/27/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface RepositoriesViewController : UITableViewController {
	RootViewController *rootViewController;
	NSArray *repositories;
}

@property (nonatomic, strong) RootViewController *rootViewController;
@property (nonatomic, strong) NSArray *repositories;

@end
