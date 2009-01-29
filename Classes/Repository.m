//
//  Repository.m
//  git-phone
//
//  Created by Sam Schroeder on 1/19/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Repository.h"
#import "Connector.h"


@implementation Repository

@synthesize name;
@synthesize privateRepo;

+ (NSString *)indexURL {	
	
	return [NSString stringWithFormat:@"%@/%@", 
			[[Config instance] baseAPIURL],
			[[Config instance] gitHubUserName]];
}

+ (void)loadAll {
	
	NSString *resultJSON = [Connector postToURL:[self indexURL]];
	
	NSMutableArray *publicRepoArray = [[[NSMutableArray alloc] init] autorelease];
	NSMutableArray *privateRepoArray = [[[NSMutableArray alloc] init] autorelease];
	NSMutableArray *repositories = [[[NSMutableArray alloc] init] autorelease];
	
	// GitHub JSON: {"user": {"repositories": [{repo1},{repo1}] }}
	repositories = [[[resultJSON JSONValue] valueForKey:@"user"] valueForKey:@"repositories"];
	
	for (NSDictionary *repository in repositories) {
		Repository *tempRepo = [[[Repository alloc] init] autorelease];
		[tempRepo setName:[repository valueForKey:@"name"]];
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

- (void) dealloc {
	[name release];
	[privateRepo release];
	[super dealloc];
}


@end
