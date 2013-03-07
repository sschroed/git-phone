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

- (void)rememberCredentials {
  // Save current credentials to the defaults database
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setValue:gitHubUserName forKey:@"GitHubUserName"];
  [defaults setValue:gitHubToken    forKey:@"GitHubToken"];
}

- (void)forgetCredentials {
  // Clear credentials from defautls database
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setValue:nil forKey:@"GitHubUserName"];
  [defaults setValue:nil forKey:@"GitHubToken"];
}



@end