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
	NSString *baseURL;
}

@property (copy) NSString *gitHubUserName;
@property (copy) NSString *baseURL;

+ (Config *)instance;

@end
