//
//  TokenView.m
//  objc_Test
//
//  Created by apple on 15/8/30.
//  Copyright (c) 2015年 Neusoft. All rights reserved.
//

#import "TokenView.h"
#import <Masonry/Masonry.h>

@interface TokenView ()
@property(nonatomic,strong)UILabel* label;


@end
@implementation TokenView

-(id)initWithString:(NSString*)title{
    if (self = [super init]) {
        self.title = title;
    }
   
    return self;
}



-(void)setTitle:(NSString *)title{
   // self.backgroundColor = [UIColor grayColor];
    if (![self.subviews containsObject:self.label]) {
        self.label = [[UILabel alloc]initWithFrame:CGRectZero];
        [self addSubview:self.label];
    }
    [self.label setText:title];
    [self.label sizeToFit];
    [self.label setBackgroundColor:[UIColor redColor]];
    //[self setContentHuggingPriority:1200 forAxis:UILayoutConstraintAxisHorizontal];
    // TO 改变edge 肯定会有冲突
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(self.label);
    //    make.right.equalTo(self.label).priorityHigh();
    }];
}


@end
