//
//  WasherView.h
//  WasherFSM
//
//  Created by wharlim on 2017/9/20.
//  Copyright © 2017年 wharlim. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    WasherViewStatusStandby,        //待机
    WasherViewStatusCountDown,      //开始倒计时
    WasherViewStatusWorking,        //高速转动
} WasherViewStatus;

@interface WasherView : UIView

-(void)changeStatus:(WasherViewStatus)status;

@end

