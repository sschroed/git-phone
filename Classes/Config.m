//
//  Config.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Config.h"


@implementation Config

@synthesize gitHubUserName;
@synthesize gitHubToken;
@synthesize baseURL;
@synthesize publicRepositories;
@synthesize privateRepositories;

// Make model a singleton
+ (Config *)instance
{
	static Config *gInstance = NULL;
	
	@synchronized(self)
    {
		if (gInstance == NULL)
			gInstance = [[self alloc] init];
    }
	return(gInstance);
}

- (NSString *)baseAPIURL {
	return [NSString stringWithFormat:@"%@/api/v1/json", [[Config instance] baseURL]];
}

- (void) dealloc {
	[gitHubUserName release];
	[gitHubToken release];
	[baseURL release];
	[publicRepositories	release];
	[privateRepositories release];
	[super dealloc];
}

@end