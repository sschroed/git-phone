//
//  ConnectivityController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/17/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "ConnectivityController.h"

@implementation ConnectivityController


+ (BOOL)isGitHubWebServiceReachable:(NSString *)url {	
	[[Reachability sharedReachability] setHostName:[[NSURL URLWithString:url] host]];
	return [[Reachability sharedReachability] remoteHostStatus] != NotReachable;
}

@end
