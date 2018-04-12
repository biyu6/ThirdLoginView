//
//  UIButton+BYUpDown.h
//  Unity-iPhone
//
//  Created by fuyuan wang on 2018/4/10.
//设置上图下文的Btn


#import <UIKit/UIKit.h>

@interface UIButton (BYUpDown)
//图上文下水平居中间距可调Btn，使用时确保Btn宽度不小于图片宽度
- (void)upImageAndDownTitle:(CGFloat)space;


@end
