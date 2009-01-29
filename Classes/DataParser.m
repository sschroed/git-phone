//
//  DataParser.m
//  photocheck
//
//  Created by Damon Allison on 12/19/08.
//  Copyright 2008 CodeMorphic, Inc. All rights reserved.
//

#import "DataParser.h"


@implementation DataParser

+ (NSNumber *) readInt:(id)value {
	
	if(value == nil || [value isKindOfClass:[NSNull class]])
		return [NSNumber numberWithInt:0];
	
	return [NSNumber numberWithInt:[value intValue]];
}

@end
