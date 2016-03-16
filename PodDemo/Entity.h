//
//  Entity.h
//  PodDemo
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;

-(id)initWithName:(NSString*)name age:(NSInteger)age;
@end
