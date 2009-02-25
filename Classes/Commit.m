//
//  Commit.m
//  git-phone
//
//  Created by Sam Schroeder on 2/7/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Commit.h"

@implementation Commit

@synthesize commitID;
@synthesize message;
@synthesize url;
@synthesize authorName;
@synthesize authorEmail;

+ (NSString *)indexURLwithRepository:(NSString *)repository {	
	
	return [NSString stringWithFormat:@"%@/%@/%@/commits/master", 
			[[Config instance] baseAPIURL],
			[[Config instance] gitHubUserName],
			repository];
}

//TODO: this needs to be thought out better.  Maybe loaded on the repo.
+ (NSArray *)loadAllfromRepository:(NSString *)repository {
	
	NSMutableArray *commitsArray = [[[NSMutableArray alloc] init] autorelease];
	NSString *resultJSON = [Connector postToURL:[self indexURLwithRepository:repository]];
	
	NSMutableArray *commits = [[[NSMutableArray alloc] init] autorelease];
	
	commits = [[resultJSON JSONValue] valueForKey:@"commits"];
	
	for (NSDictionary *commit in commits) {
		Commit *tempCommit = [[[Commit alloc] init] autorelease];
		
		[tempCommit setCommitID:[commit valueForKey:@"id"]];
		[tempCommit setMessage:[commit valueForKey:@"message"]];
		[tempCommit setUrl:[commit valueForKey:@"url"]];
		[tempCommit setAuthorName:[[commit valueForKey:@"author"] valueForKey:@"name"]];
		[tempCommit setAuthorEmail:[[commit valueForKey:@"author"] valueForKey:@"email"]];
		
		DevLog2(@"Loaded Commit: %@", [tempCommit commitID]);

		[commitsArray addObject:tempCommit];
	}
	return commitsArray;
}

- (void) dealloc {
	[commitID release];
	[message release];
	[url release];
	[authorName release];
	[authorEmail release];
	[super dealloc];
}


@end
