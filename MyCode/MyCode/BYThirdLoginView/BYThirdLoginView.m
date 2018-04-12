//
//  BYThirdLoginView.m
//  Unity-iPhone
//
//  Created by fuyuan wang on 2018/4/10.
//第三方登录的view

#import "BYThirdLoginView.h"
#import "UIButton+BYUpDown.h"//设置上图下文的Btn
//#import <TencentOpenAPI/QQApiInterface.h>//友盟-QQ
//#import "WXApi.h"//友盟-微信
//#import "WeiboSDK.h"//友盟-微博

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]//RGBA(51,51,51,1)
#define SafeStr(f) (StrValid(f) ? f:@"")//获取到一个安全的字符串
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])//判断是否是一个有效的字符串
static clickThirdLoginBtn thirdItemClick = nil;
@interface BYThirdLoginView()

@end
@implementation BYThirdLoginView
- (void)addLoginViewItemWidth:(CGFloat)itemW isShowTitle:(BOOL)isShow action:(clickThirdLoginBtn)btnClick{
    self.backgroundColor = RGBA(68,68,68,0.1);
    //1.判断当前设备安装了几个第三方的app(使用的是UMSocial,可用以注释的方法来做)
    BOOL isQQ = YES; //[QQApiInterface isQQInstalled];//是否安装了QQ
    BOOL isWechat = YES; //[WXApi isWXAppInstalled];//是否安装了微信
    BOOL isWeibo = YES; //[WeiboSDK isWeiboAppInstalled];//是否安装了新浪微博
    
    int itemCount = 0;
    NSMutableArray *itemArrM = [NSMutableArray array];
    if (isQQ) {
        itemCount++;
        NSDictionary *dic = isShow ? @{@"img":@"qq",@"name":@"QQ",@"tag":@1} : @{@"img":@"qq",@"tag":@1};
        [itemArrM addObject:dic];
    }
    if (isWechat) {
        itemCount++;
        NSDictionary *dic = isShow ? @{@"img":@"weChat",@"name":@"微信",@"tag":@2} : @{@"img":@"weixin",@"tag":@2};
        [itemArrM addObject:dic];
    }
    if (isWeibo) {
        itemCount ++;
        NSDictionary *dic = isShow ? @{@"img":@"weibo",@"name":@"新浪微博",@"tag":@3} : @{@"img":@"weibo",@"tag":@3};
        [itemArrM addObject:dic];
    }
    if (itemCount == 0) {//若一个都没装--隐藏自己，完事
        self.hidden = YES;
        return;
    }
    //2.设置每个按钮的值
    NSArray *itemArr = itemArrM.copy;
    CGFloat btnH = self.bounds.size.height;//按钮的高度
    CGFloat spaceW = (self.bounds.size.width - itemCount*itemW)/(itemCount + 1);//按钮之间的间距，默认平分当前view的宽度
    for (int i = 0; i < itemArr.count; ++i) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(spaceW + (itemW +spaceW)*i, 0, itemW, btnH);
//        btn.backgroundColor = RGBA(255, 193, 193, 0.7);
        //获取按钮的值
        NSDictionary *dic = itemArrM[i];
        NSString *titleStr = SafeStr([dic objectForKey:@"name"]);
        NSString *imgNameStr = [dic objectForKey:@"img"];
        NSNumber *tagNum = [dic objectForKey:@"tag"];
        //给按钮赋值
        [btn setImage:[UIImage imageNamed:imgNameStr] forState:UIControlStateNormal];
        btn.tag = 100 + [tagNum integerValue];
        [btn addTarget:self action:@selector(thirdLoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //如果有文本，才设置上图下文
        if (titleStr.length != 0) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitle:titleStr forState:UIControlStateNormal];
            [btn upImageAndDownTitle:5];//设置上图下文水平居中，间距为5
        }
        thirdItemClick = btnClick;
        [self addSubview:btn];
    }
}
- (void)thirdLoginBtnClick:(UIButton *)btn{
    if (thirdItemClick) {
        thirdItemClick(btn.tag);
    }
}

#pragma mark- 数据处理


#pragma mark- 用户交互


@end
