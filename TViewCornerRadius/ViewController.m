//
//  ViewController.m
//  TViewCornerRadius
//
//  Created by 唐鹏 on 2018/7/31.
//  Copyright © 2018年 唐鹏. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TCornerRadius.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(10, 30, 70, 100);
    [self.view addSubview:view];
    
//    [view setCornerRadius:35 rectCorner:UIRectCornerBottomRight | UIRectCornerBottomLeft];
    [view setMultiCornerRadius:TMakeCornerRadius(10, 11, 12, 13) rectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
