//
//  RepoCommitsViewController.h
//  git-phone
//
//  Created by Sam Schroeder on 2/7/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RepoCommitsViewController : UITableViewController {
	NSArray *repoCommits;
}

@property (nonatomic, retain) NSArray *repoCommits;

@end
