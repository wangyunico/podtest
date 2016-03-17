//
//  SecondVC.m
//  PodDemo
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "SecondVC.h"
#import <Masonry/Masonry.h>

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    // 使这三个控件等高
    CGFloat padding = 10;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
        // 三个控件等高
        make.height.mas_equalTo(@[redView, blueView]);
        // 红、绿这两个控件等宽
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(greenView);
        make.bottom.mas_equalTo(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
