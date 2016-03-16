//
//  ThirdVC.m
//  PodDemo
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "ThirdVC.h"
#import <ObjectiveSugar/ObjectiveSugar.h>
@interface ThirdVC ()
@property(nonatomic,strong)NSNumber *index;
@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [@3 timesWithIndex:^(NSUInteger index) {
        self.index = @(index); // 是否存在引用循环？
    }];
}

-(void)test{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    NSLog(@"viewController is delloced");
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
