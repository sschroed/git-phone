//
//  NSDictionary+JSON.m
//  git-phone
//
//  Created by Maxthon Chan on 13-3-7.
//
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (NSString *)JSONRepresentation
{
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self
                                                                           options:0
                                                                             error:NULL]
                                  encoding:NSUTF8StringEncoding];
}

@end
