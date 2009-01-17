//
//  ConnectivityController.h
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "Reachability.h"

@interface ConnectivityController : NSObject

+ (BOOL)isGitHubWebServiceReachable:(NSString *)url;

@end
