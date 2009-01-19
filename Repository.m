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

+ (NSString *)indexURL {	
	
	return [NSString stringWithFormat:@"%@/%@", 
			[[Config instance] baseAPIURL],
			[[Config instance] gitHubUserName]];
}

+ (void)loadAll {
	NSString *resultJSON = [Connector getJSONFromURL:[self indexURL]];
	
	NSMutableArray *returnArray = [[[NSMutableArray alloc] init] autorelease];
	NSMutableArray *repositories = [[[NSMutableArray alloc] init] autorelease];
	
	// GitHub JSON: {"user": {"repositories": [{repo1},{repo1}] }}
	repositories = [[[resultJSON JSONValue] valueForKey:@"user"] valueForKey:@"repositories"];
	
	for (NSDictionary *repository in repositories) {
		Repository *tempRepo = [[[Repository alloc] init] autorelease];
		[tempRepo setName:[repository valueForKey:@"name"]];
		DevLog2(@"Loaded Repo: %@", [tempRepo name]);
		
		[returnArray addObject:tempRepo];		
	}
	
	[[Config instance] setRepositories:returnArray];
}


@end
