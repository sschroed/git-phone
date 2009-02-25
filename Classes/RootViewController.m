//
//  RootViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "RootViewController.h"
#import "git_phoneAppDelegate.h"
#import "RepositoriesViewController.h"


@implementation RootViewController



- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"GitHub GitPhone";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSInteger rows;
	
	switch(section) {
		case 0: {
			rows = 2;
			break;
		}
		case 1: {
			rows =  1;
			break;
		}
		case 2: {
			rows =  1;
			break;
		}
		case 3: {
			rows =  1;
			break;
		}
	}
	return rows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GitHub"];
	if(cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}

	switch(indexPath.section) {
		case 0: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"Public Repositories";
					cell.image = [UIImage imageNamed:@"public.png"];
					break;
				}
				case 1: {
					cell.text = @"Private Repositories";
					cell.image = [UIImage imageNamed:@"private.png"];
					break;
				}
			}
			break;
		}
		case 1: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"News Feed";
					cell.image = [UIImage imageNamed:@"feed.png"];
					break;
				}
			}
			break;
		}
		case 2: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"Search";
					cell.image = [UIImage imageNamed:@"octocat_small.png"];
					break;
				}
			}
			break;
		}
		case 3: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"About GitHub GitPhone";
					cell.image = [UIImage imageNamed:@"octocat_small.png"];
					break;
				}
			}
			break;
		}
	}
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	RepositoriesViewController *repositoriesViewController = [[[RepositoriesViewController alloc] initWithNibName:@"RepositoriesView" bundle:nil] autorelease];

	switch(indexPath.section) {
		case 0: {
			switch(indexPath.row) {
				case 0: {
					[repositoriesViewController.repositories release];
					repositoriesViewController.repositories = [[Config instance] publicRepositories];
					break;
				}
				case 1: {
					[repositoriesViewController.repositories release];
					repositoriesViewController.repositories = [[Config instance] privateRepositories];
					break;
				}
			}
			break;
		}
		case 1: {
			break;
		}
	}
	
	
	repositoriesViewController.rootViewController = self;
	[self.navigationController pushViewController:repositoriesViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end

