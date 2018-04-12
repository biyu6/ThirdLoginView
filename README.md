# BYThirdLoginView
封装了一个第三方登录的View，主要解决根据是否安装第三方来进行中间布局的问题
#### 1.没有安装的APP不显示。 
#### 2.已安装的APP会居中布局。

### 主要代码如下：
```
_thirdLoginView = [[BYThirdLoginView alloc]initWithFrame: ];
[_thirdLoginView addLoginViewItemWidth:90 isShowTitle:YES action:^(NSInteger tag) {
	NSLog(@"点击了btn:%zd",tag); //QQ101、微信102、微博103
}];
[self.view addSubview:_thirdLoginView];


```

![image](https://github.com/biyu6/ThirdLoginView/blob/master/1.png)
![image](https://github.com/biyu6/ThirdLoginView/blob/master/2.png)
![image](https://github.com/biyu6/ThirdLoginView/blob/master/3.png)