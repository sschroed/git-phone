//
//  Repository.m
//  git-phone
//
//  Created by Sam Schroeder on 1/19/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Repository.h"
#import "Connector.h"
#import "Commit.h"
#import "NSString+JSON.h"

@implementation Repository

@synthesize name;
@synthesize owner;
@synthesize privateRepo;
@synthesize commits;

+ (NSString *)indexURL {	
	
	return [NSString stringWithFormat:@"%@/%@", 
			[[Config instance] baseAPIURL],
			[[Config instance] gitHubUserName]];
}

- (NSString *)commitsURL {
	// http://github.com/api/v1/json/caged/gitnub/commits/master
	return [NSString stringWithFormat:@"%@/%@/%@/commits/master", 
			[[Config instance] baseAPIURL],
			[self owner],
			[self name]];
}

+ (void)loadAll {
	NSString *resultJSON = [Connector postToURL:[self indexURL]];
	
	NSMutableArray *publicRepoArray = [[NSMutableArray alloc] init];
	NSMutableArray *privateRepoArray = [[NSMutableArray alloc] init];
	NSMutableArray *repositories = [[NSMutableArray alloc] init];
	
	// GitHub JSON: {"user": {"repositories": [{repo1},{repo1}] }}
	repositories = [[[resultJSON JSONValue] valueForKey:@"user"] valueForKey:@"repositories"];
	
	for (NSDictionary *repository in repositories) {
		Repository *tempRepo = [[Repository alloc] init];
		[tempRepo setName:[repository valueForKey:@"name"]];
		[tempRepo setOwner:[repository valueForKey:@"owner"]];
		[tempRepo setPrivateRepo:[DataParser readInt:[repository valueForKey:@"private"]]];
		
		DevLog2(@"Loaded Repo: %@", [tempRepo name]);
		
		if ([tempRepo privateRepo] == [DataParser readInt:@"1"]) {
			[privateRepoArray addObject:tempRepo];
		} else {
			[publicRepoArray addObject:tempRepo];
		}
	}
	
	[[Config instance] setPublicRepositories:publicRepoArray];
	[[Config instance] setPrivateRepositories:privateRepoArray];
}

- (void)loadCommits {
	NSString *resultJSON = [Connector postToURL:[self commitsURL]];

	NSMutableArray *commitsArray = [[NSMutableArray alloc] init];
	NSMutableArray *repoCommits = [[NSMutableArray alloc] init];
	
	repoCommits = [[resultJSON JSONValue] valueForKey:@"commits"];
	
	for (NSDictionary *commit in repoCommits) {
		Commit *tempCommit = [[Commit alloc] init];
		[tempCommit setCommitID:[commit valueForKey:@"id"]];
		[tempCommit setMessage:[commit valueForKey:@"message"]];
		[tempCommit setUrl:[commit valueForKey:@"url"]];
		[tempCommit setAuthorName:[[commit valueForKey:@"author"] valueForKey:@"name"]];
		[tempCommit setAuthorEmail:[[commit valueForKey:@"author"] valueForKey:@"email"]];
		
		DevLog2(@"Loaded Commit: %@", [tempCommit message]);
		 
		[commitsArray addObject:tempCommit];
	}
	
	[self setCommits:commitsArray];
}



@end
