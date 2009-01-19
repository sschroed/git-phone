//
//  Repository.h
//  git-phone
//
//  Created by Sam Schroeder on 1/19/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//


@interface Repository : NSObject {
	NSString *name;
}

@property (nonatomic, retain) NSString *name;

+ (NSString *)indexURL;
+ (void)loadAll;

@end
