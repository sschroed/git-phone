//
//  Commit.h
//  git-phone
//
//  Created by Sam Schroeder on 2/7/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//
//
//{
//	"commits": [
//    {
//		"message": "Updated readme with DQMultipartForm information", 
//		"parents": [{"id": "97638b6d7e2f657c1b9debdb9798ccb8e44ef0ed"}], 
//		"url": "http://github.com/sschroed/mini-mallows/commit/cb106e80912c140fbb4fc26448f370c0b154a999", 
//		
//		"author": {
//			"name": "Vladimir Pouzanov", 
//			"email": "farcaller@gmail.com"
//		}, 
//		
//		"id": "cb106e80912c140fbb4fc26448f370c0b154a999", 
//		"committed_date": "2008-12-24T06:43:15-08:00", 
//		"authored_date": "2008-12-24T06:43:15-08:00", 
//		"tree": "47b3669803f1ddc73d0f9222fe8729ad4661cab0", 
//        
//		"committer": {
//			"name": "Vladimir Pouzanov", 
//			"email": "farcaller@gmail.com"
//		}
//    }
//	]
//}


@interface Commit : NSObject {
	NSString *commitID;
	NSString *message;
	NSString *url;
	NSString *authorName;
	NSString *authorEmail;
}

@property (nonatomic, retain) NSString *commitID;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *authorName;
@property (nonatomic, retain) NSString *authorEmail;


@end
