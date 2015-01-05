//
//  PullMenu.h
//  PullMenuDemo
//
//  Created by linaicai on 15/1/4.
//  Copyright (c) 2015年 linaicai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectBlock)(NSString *text);
typedef NS_ENUM(NSInteger, PullMenuStatus)
{
    PullMenuStatus_show = 0,
    PullMenuStatus_diss = 1
};
@interface PullMenu : UIView
@property(nonatomic,copy)SelectBlock valueChangeBlock;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic)NSInteger status;

- (id)initWithFrame:(CGRect)frame Data:(NSArray *)data;
-(void)pullMenuShow;
-(void)pullMenuDismiss;
@end
