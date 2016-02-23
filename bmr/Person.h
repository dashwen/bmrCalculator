//
//  Person.h
//  bmr
//
//  Created by Deshawn Dana on 2/17/16.
//  Copyright © 2016 Deshawn Dana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,strong) NSNumber *height;
@property(nonatomic,strong) NSNumber *weight;
@property(nonatomic,strong) NSNumber *age;

+ (void) initialize;
+ (Person*) sharedPersonInstance;
+ (id) allocWithZone: (NSZone*) aZone;
- (float) calculateMaleBMR;
- (float) calculateFemaleBMR;


@end
