//
//  WasherView.m
//  WasherFSM
//
//  Created by wharlim on 2017/9/20.
//  Copyright © 2017年 wharlim. All rights reserved.
//

#import "WasherView.h"

#define COUNTDOWNTIME 5



@interface WasherView()

@property (nonatomic,strong) NSTimer *timer;

@end


@implementation WasherView{
    WasherViewStatus _currentStatus;
    int _countDown;
    
    UILabel *_currentStatusLabel;
    UIButton *_workBtn;
    UIButton *_stopBtn;
}

-(NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownToTurn) userInfo:nil repeats:YES];
    }
    return _timer;
}

-(instancetype)init{
    if (self = [super init]) {
        [self initializeView];
        [self changeStatus:WasherViewStatusStandby];
    }
    return self;
}


-(void)initializeView{
    self.frame = CGRectMake(100, 50, 200, 200);
    self.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    _currentStatusLabel = label;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 40, 40)];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    _workBtn = btn;
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(130, 100, 40, 40)];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    _stopBtn = btn;
    
}


-(void)start:(UIButton *)btn{
    [self changeStatus:WasherViewStatusCountDown];
}

-(void)cancel:(UIButton *)btn{
    [self changeStatus:WasherViewStatusStandby];
}

-(void)countDownToTurn{
    _countDown--;
    if (_countDown == 0) {
        [self changeStatus:WasherViewStatusWorking];
    }
}

-(void)changeStatus:(WasherViewStatus)status{
    switch (status) {
        case WasherViewStatusStandby:
        {
            _currentStatus = status;
            _currentStatusLabel.text = @"准备就绪";
            _workBtn.enabled = YES;
            _workBtn.backgroundColor = [UIColor greenColor];
            
            _stopBtn.enabled = NO;
            _stopBtn.backgroundColor = [UIColor redColor];
            [self stopTimer];
        }
            break;
        case WasherViewStatusCountDown:
        {
            if (_currentStatus == WasherViewStatusStandby){
                //继续
            } else {
                break;
            }
            _currentStatus = status;
            _currentStatusLabel.text = @"正在倒计时";
            _workBtn.enabled = NO;
            _workBtn.backgroundColor = [UIColor redColor];
            
            _stopBtn.enabled = YES;
            _stopBtn.backgroundColor = [UIColor greenColor];
            
            [self stopTimer];
            _countDown = COUNTDOWNTIME;
            [self.timer fire];
            
        }
            break;
        case WasherViewStatusWorking:
        {
            if (_currentStatus == WasherViewStatusCountDown){
                //继续
            } else {
                break;
            }
            _currentStatus = status;
            _currentStatusLabel.text = @"正在高速转动";
            _workBtn.enabled = NO;
            _workBtn.backgroundColor = [UIColor redColor];
            
            _stopBtn.enabled = NO;
            _stopBtn.backgroundColor = [UIColor redColor];
            
            [self stopTimer];
        }
            break;
            
        default:
            break;
    }
}

-(void)stopTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

-(void)dealloc{
    [self stopTimer];
}

@end


