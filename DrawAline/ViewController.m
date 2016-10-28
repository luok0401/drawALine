//
//  ViewController.m
//  DrawAline
//
//  Created by macbook on 2016/10/28.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化drawView，Frame大小为主视图的大小
    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    //将DrawView添加到主视图
    [self.view addSubview:drawView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
