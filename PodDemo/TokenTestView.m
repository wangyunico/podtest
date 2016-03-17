//
//  TokenTestView.m
//  objc_Test
//
//  Created by apple on 15/8/30.
//  Copyright (c) 2015年 Neusoft. All rights reserved.
//

#import "TokenTestView.h"
#import <Masonry/Masonry.h>
#import "TokenView.h"
@interface TokenTestView ()

@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIView* contentView; // 内容的View
@property(nonatomic,strong)NSMutableArray* tokens;
@property(nonatomic,strong)MASConstraint* rightConstraint;
@property(nonatomic,assign) BOOL isupdateLayout;
@end

@implementation TokenTestView

static float tokensWidth = 0.0;

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.isupdateLayout = NO;
        
        self.tokens = [@[]mutableCopy];
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        self.contentView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor blueColor];
        self.scrollView.backgroundColor = [UIColor orangeColor];
        self.scrollView.showsHorizontalScrollIndicator = YES;
    }
    return self;
}



-(void)updateConstraints {
    if (!self.isupdateLayout) {
        
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);// 修改的不容易啊
            make.width.mas_greaterThanOrEqualTo(self.scrollView.mas_width);//.priorityHigh();
            make.height.mas_equalTo(self.scrollView.mas_height);
        }];
        self.isupdateLayout = YES;
    }
    [super updateConstraints];
}


-(void)addTokenWithTitle:(NSString*)title{
    TokenView* currentToken = [[TokenView alloc]initWithString:title];
    currentToken.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:currentToken];
    TokenView* backwardToken = [self.tokens lastObject];
    [self.tokens addObject:currentToken];
    if (backwardToken == nil) {
        [currentToken mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            
        }];
        
    }else{
        [currentToken mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.contentView);
            
            make.left.equalTo(backwardToken.mas_right).with.offset(2);
            
        }];
        
    }
    //  [currentToken setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    // NSLog(@"%f",currentToken.label.intrinsicContentSize.width);
    // 可以根据判断，另外可以增加一个View用于支撑，支撑拉伸用的，使得
    tokensWidth +=[currentToken systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width +2.f;
    if (tokensWidth >= self.scrollView.contentSize.width) {
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            [self.rightConstraint uninstall];
            self.rightConstraint =  make.right.equalTo(currentToken.mas_right).with.offset(5);
        }];
    }
    
    
    //   [self updateConstraints];
    [self updateConstraintsIfNeeded];
}




@end
