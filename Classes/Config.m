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
@synthesize baseURL;

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

- (void) dealloc {
	[gitHubUserName release];
	[baseURL release];
	[super dealloc];
}

@end