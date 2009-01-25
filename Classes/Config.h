//
//  Config.h
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Config : NSObject {
	NSString *gitHubUserName;
	NSString *gitHubToken;
	NSString *baseURL;
	NSMutableArray *repositories;
}

@property (copy) NSString *gitHubUserName;
@property (copy) NSString *gitHubToken;
@property (copy) NSString *baseURL;
@property (copy) NSMutableArray *repositories;

+ (Config *)instance;
- (NSString *)baseAPIURL;

@end
