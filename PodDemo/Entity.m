//
//  Entity.m
//  PodDemo
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "Entity.h"

@implementation Entity


-(id)initWithName:(NSString*)name age:(NSInteger)age{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

@end
