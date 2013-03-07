//
//  RepositoriesViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/27/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "RepoCommitsViewController.h"


@implementation RepositoriesViewController

@synthesize rootViewController;
@synthesize repositories;

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Repositories";
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    return [repositories count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"RepositoryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Set up the cell...
	cell.textLabel.text = [(Repository *)repositories[[indexPath row]] name];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoCommitsViewController *repoCommitsViewController = [[RepoCommitsViewController alloc] initWithNibName:@"RepoCommitsView" bundle:nil];
	Repository *repository = repositories[[indexPath row]];
	
	//repoCommitsViewController.repoCommits;
	//repository.commits;
	[repository loadCommits];
	repoCommitsViewController.repoCommits = repository.commits;
	
	[self.navigationController pushViewController:repoCommitsViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end

