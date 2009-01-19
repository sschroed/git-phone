//
//  Connector.h
//  iProtect
//
//  Created by Sam Schroeder on 9/3/08.
//  Copyright 2008 Proton Microsystems, LLC. All rights reserved.
//
//  The sole responsibility of the Connector is to communicate with to the iProtect web service.
//	It passes on data sent to it from the application or web server.  It does no direct processing
//	on the data.

@interface Connector : NSObject

+ (NSMutableURLRequest *)jsonURLRequest:(NSString *)url;
+ (NSMutableURLRequest *)jsonURLRequest:(NSString *)url withDictionary:(NSDictionary *)dictionary;

+ (NSString *) getJSONFromURL:(NSString *)url;  // issue a GET request
+ (NSString *) getJSONFromURL:(NSString *)url withDictionary:(NSDictionary *)dictionary;  // issues a POST request

@end
