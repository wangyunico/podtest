//
//  ViewController.m
//  PodDemo
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "ViewController.h"
#import "TokenView.h"
#import "TokenTestView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
@property(nonatomic,strong)TokenTestView* testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[TokenTestView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.testView];
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 50, 50)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //    UIButton* jumpButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 350, 50, 50)];
    //    jumpButton.backgroundColor = [UIColor brownColor];
    //    [self.view addSubview:jumpButton];
    //    [jumpButton addTarget:self action:@selector(jumpPage:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)updateViewConstraints{
    
    
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)jumpPage:(UIButton*)button {
    //    UIViewController* viewController = [[ViewController alloc]init];
    //    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)buttonTap:(UIButton*)button{
    NSArray* strArray = @[@"颜小强",@"王卫",@"木曦怎么飏不起来了",@"上海陆家嘴国际金融资产交易市场股份有限公司"];
    int index = arc4random()%4;
    [self.testView addTokenWithTitle:strArray[index]];
    
    //        [self.layoutTestView mas_updateConstraints:^(MASConstraintMaker *make) {
    //
    //            make.width.mas_equalTo(60);
    //        }];
    //       [self updateViewConstraints];
}

@end
