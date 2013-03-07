//
//  Connector.m
//  iProtect
//
//  Created by Sam Schroeder on 9/3/08.
//  Copyright 2008 Proton Microsystems, LLC. All rights reserved.
//
//  The sole responsibility of the Connector is to communicate with to the iProtect web service.
//	It passes on data sent to it from the application or web server.  It does no direct processing
//	on the data.

#import "Connector.h"
#import "NSDictionary+JSON.h"

@implementation Connector

#pragma mark -
#pragma mark Class Methods

+ (NSMutableURLRequest *)jsonURLRequest:(NSString *)url {
	NSMutableURLRequest *jsonRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
															   cachePolicy:NSURLRequestUseProtocolCachePolicy
														   timeoutInterval:30.0];	
	// Set request params for sending JSON
	[jsonRequest setHTTPMethod:@"GET"];
	[jsonRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[jsonRequest setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
	
	return jsonRequest;
}

+ (NSMutableURLRequest *)jsonURLRequest:(NSString *)url withDictionary:(NSDictionary *)dictionary {
	NSMutableURLRequest *jsonRequest = [self jsonURLRequest:url];
	
	// Set request params for sending JSON
	[jsonRequest setHTTPMethod:@"POST"];
	
	// Change dictionary into JSON data.  
	// Rails webservice expects all post JSON to be wrapped in a "data" param. 
	NSDictionary *dataDictionary = @{@"data": [dictionary JSONRepresentation]};
	NSString *jsonString = [NSString stringWithString: [dataDictionary JSONRepresentation]];

	NSData *jsonBody = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	[jsonRequest setHTTPBody:jsonBody];
	
	return jsonRequest;
}

// Send a GET to the server, return JSON string.
+ (NSString *) getJSONFromURL:(NSString *)url {
	NSMutableURLRequest *req = [self jsonURLRequest:url];
	NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;

	DevLog2(@"Retrieving JSON from URL: %@", url);
	
	urlData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];

	NSString *str = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
	
	DevLog3(@"Retrieved JSON from URL: %@ \n%@", url, str);

	return str;

}

// Send a POST to the server with the attached JSON dictionary, return JSON string.
+ (NSString *) getJSONFromURL:(NSString *)url withDictionary:(NSDictionary *)dictionary {
	
	DevLog3(@"Sending JSON to %@: %@", url, [dictionary JSONRepresentation]);
	
	NSMutableURLRequest *req = [self jsonURLRequest:url withDictionary:dictionary];
	NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;
	
	urlData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];

	NSString *resp = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
	DevLog3(@"Received JSON from URL: %@\n%@", url, resp);
	return resp;
	
}

// Standard POST
+ (NSString *)postToURL:(NSString *)url {
	
	NSString *post = [NSString stringWithFormat:@"login=%@&token=%@", [[Config instance] gitHubUserName], [[Config instance] gitHubToken]];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *postRequest = [[NSMutableURLRequest alloc] init];
	[postRequest setURL:[NSURL URLWithString:url]];
	[postRequest setHTTPMethod:@"POST"];
	[postRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[postRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[postRequest setHTTPBody:postData];
	
	
	NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;
		
	urlData = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
	
	NSString *resp = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
	
	DevLog3(@"Received JSON from URL via POST: %@\n%@", url, resp);
	
	return resp;
}

// Make sure username & token authenticate
// TODO: Refactor this call
+ (BOOL)didAuthenticateUser:(NSString *)user withToken:(NSString *)token {
	NSString *post = [NSString stringWithFormat:@"login=%@&token=%@", user, token];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	NSMutableURLRequest *postRequest = [[NSMutableURLRequest alloc] init];
	[postRequest setURL:[NSURL URLWithString:@"http://github.com"]];
	[postRequest setHTTPMethod:@"POST"];
	[postRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[postRequest setHTTPBody:postData];
	
	NSData *urlData;
	NSURLResponse *response;
	NSError *error = nil;
	
	urlData = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
	
	if (error == nil) {
		DevLog(@"Authenticated");
		return YES;
	} else {
		DevLog(@"Not Authenticated");
		return NO;
	}
}

@end
