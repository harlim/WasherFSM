//
//  ViewController.m
//  WasherFSM
//
//  Created by wharlim on 2017/9/20.
//  Copyright © 2017年 wharlim. All rights reserved.
//

#import "ViewController.h"
#import "WasherView.h"

@interface ViewController ()

@end

@implementation ViewController{
    WasherView *_washerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _washerView = [[WasherView alloc] init];
    [self.view addSubview:_washerView];
    
    
    //添加 断电重启按钮开关
    [self addRestartBtn];
     
    
    /*
    [self addCountDownBtn];
    */
    
}


-(void)addRestartBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 250, 80, 40)];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"断电重启" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)restart:(UIButton *)btn{
    [_washerView changeStatus:WasherViewStatusStandby];
}
 

/*

-(void)addCountDownBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 80, 40)];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"强制开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(countDown:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)countDown:(UIButton *)btn{
    [_washerView changeStatus:WasherViewStatusCountDown];
}
*/

@end
