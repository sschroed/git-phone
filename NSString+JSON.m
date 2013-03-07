//
//  NSString+JSON.m
//  git-phone
//
//  Created by Maxthon Chan on 13-3-7.
//
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

- (id)JSONValue
{
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                           options:0
                                             error:NULL];
}

@end
