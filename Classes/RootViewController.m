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
    
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
			break;
		}
	}
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	RepositoriesViewController *repositoriesViewController = [[[RepositoriesViewController alloc] initWithNibName:@"RepositoriesView" bundle:nil] autorelease];
	//repositoriesViewController.repositories = [photochecks objectAtIndex:[indexPath row]];
	repositoriesViewController.rootViewController = self;
	//[self.navigationController pushViewController:tableView animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end

