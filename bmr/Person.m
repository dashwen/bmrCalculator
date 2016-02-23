//
//  Person.m
//  bmr
//
//  Created by Deshawn Dana on 2/17/16.
//  Copyright © 2016 Deshawn Dana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@implementation Person

@synthesize height;
@synthesize weight;
@synthesize age;


static Person* _sharedPersonInstance;

// *** sourced from cs411demos credits to Shafae ***
+ (void) initialize
{
    if( [Person class] == self ){
        _sharedPersonInstance = [self new];  // [[ alloc] init] for clarity sake
    }
}

+ (Person*) sharedPersonInstance
{
    return _sharedPersonInstance;
}

+ (id) allocWithZone: (NSZone*) aZone
{
    if( _sharedPersonInstance && [Person class] == self ){
        [NSException raise: NSGenericException format: @"May not create more than one instance of a Person class!"];
    }
    return [super allocWithZone: aZone];
}
// *******

- (float) calculateMaleBMR
{
    float w = [[self weight] floatValue];
    float h = [[self height] floatValue];
    float a = [[self age] floatValue];
    return ((w*13.397) + (h*4.799) - (a*5.677) + 88.362);
}

- (float) calculateFemaleBMR
{
    float w = [[self weight] floatValue];
    float h = [[self height] floatValue];
    float a = [[self age] floatValue];
    return ((w*9.247) + (h*3.098) - (a*4.330) + 447.593);
}






@end
