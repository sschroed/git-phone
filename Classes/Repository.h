//
//  Repository.h
//  git-phone
//
//  Created by Sam Schroeder on 1/19/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//


@interface Repository : NSObject {
	NSString *name;
	NSString *owner;
	NSNumber *privateRepo;
	NSMutableArray *commits;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSNumber *privateRepo;
@property (nonatomic, strong) NSMutableArray *commits;

+ (NSString *)indexURL;
+ (void)loadAll;
- (NSString *)commitsURL;
- (void)loadCommits;

@end
