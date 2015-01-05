PullMenu
===========
###Info | 简介

弹出下拉选择框或者列表的控件，Block回调,欢迎使用和交流
****
<img src="http://github.com/LINAICAI/PullMenu/master/screenshot.gif" />


###Userage | 使用说明

1.导入头文件

    #import "PullMenu.h"



2.初始化


    PullMenu *menu=[[PullMenu alloc]initWithFrame:CGRectMake(10, 100, 200, 35) Data:@[@"广州",@"东莞",@"深圳"]];
    [self.view addSubview:menu];
                         
3.设置block回调


    [menu setValueChangeBlock:^(NSString *text)
    {

    }];
        
        
****
###License | 许可
This code is distributed under the terms of the MIT License (MIT).
代码使用 MIT License (MIT) 许可发布.

The original author, NAICAI LI, reserves the right to change the license.
原作者 NAICAI LI 保留更改此许可的权力.
****
###Donate | 捐赠
	
[Alipay | 支付宝](https://me.alipay.com/linaicai)











