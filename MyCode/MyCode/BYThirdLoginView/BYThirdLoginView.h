//
//  BYThirdLoginView.h
//  Unity-iPhone
//
//  Created by fuyuan wang on 2018/4/10.
//第三方登录的view

#import <UIKit/UIKit.h>

typedef void (^clickThirdLoginBtn)(NSInteger tag);
@interface BYThirdLoginView : UIView
/**注意点：
    1.按钮的宽度需大于等于图标的宽度
    2.按钮的高度等于当前view的高度
    3.若展示文字，则展示的方式是图文上下水平居中，图文上下间距默认写的是5
    4.需要在本方法的开头处判断是否安装了QQ、微信、微博
 */
- (void)addLoginViewItemWidth:(CGFloat)itemW isShowTitle:(BOOL)isShow action:(clickThirdLoginBtn)btnClick;





@end
