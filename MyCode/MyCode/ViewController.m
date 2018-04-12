//
//  ViewController.m
//  MyCode
//
//  Created by 胡忠诚 on 2018/4/12.
//  Copyright © 2018年 biyu6. All rights reserved.
//

#import "ViewController.h"
#import "BYThirdLoginView.h"//第三方登录的view

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define bot_H (kDevice_Is_iPhoneX ? 34 : 0)

@interface ViewController ()
/**第三方登录的view*/
@property (nonatomic, strong)BYThirdLoginView *thirdLoginView;

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *promptLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 100, ScreenWidth - 30, 200)];
    promptLab.textColor = [UIColor blackColor];
    promptLab.numberOfLines = 0;
    promptLab.text = @"说明：\n  1.没有安装的APP不显示。\n  2.已安装的APP会居中布局。";
    [self.view addSubview:promptLab];
    
    
    
    CGFloat thirdSpace = 25;//距离两边的边距
    CGFloat thirdH = 100;//高度
    _thirdLoginView = [[BYThirdLoginView alloc]initWithFrame:CGRectMake(thirdSpace/2, ScreenHeight - thirdH - bot_H, ScreenWidth - thirdSpace, thirdH)];
    [_thirdLoginView addLoginViewItemWidth:90 isShowTitle:YES action:^(NSInteger tag) {
        NSLog(@"点击了btn:%zd",tag); //QQ101、微信102、微博103
    }];
    [self.view addSubview:_thirdLoginView];
}

@end


