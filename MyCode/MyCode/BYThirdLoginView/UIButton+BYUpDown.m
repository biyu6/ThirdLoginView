//
//  UIButton+BYUpDown.m
//  Unity-iPhone
//
//  Created by fuyuan wang on 2018/4/10.
//设置上图下文的Btn

#import "UIButton+BYUpDown.h"

@implementation UIButton (BYUpDown)
- (void)upImageAndDownTitle:(CGFloat)space{//图上文下水平居中间距可调Btn，使用时确保Btn宽度不小于图片宽度
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + space);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}


@end
