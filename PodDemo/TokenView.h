//
//  TokenView.h
//  objc_Test
//
//  Created by apple on 15/8/30.
//  Copyright (c) 2015年 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TokenView : UIControl

@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong,readonly)UILabel* label;
-(id)initWithString:(NSString*)title;
@end
