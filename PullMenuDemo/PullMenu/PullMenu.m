//
//  PullMenu.m
//  PullMenuDemo
//
//  Created by linaicai on 15/1/4.
//  Copyright (c) 2015年 linaicai. All rights reserved.
//

#import "PullMenu.h"
@implementation PullMenu
- (id)initWithFrame:(CGRect)frame Data:(NSArray *)data
{
    self.data=[NSArray arrayWithArray:data];
    return [self initWithFrame:frame];
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        
    // 再自定义该类（UIView子类）的初始化操作。
        self.textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 0, frame.size.width/5, frame.size.height)];
        [button setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.textField setRightView:button];
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 15, frame.size.height)];
        [label setText:@""];
        [label setTextColor:[UIColor grayColor]];
        [self.textField setLeftView:label];
        [self.textField setPlaceholder:@"请选择"];
        [self.textField setLeftViewMode:UITextFieldViewModeAlways];
        [self.textField setRightViewMode:UITextFieldViewModeAlways];
        [self.textField setDelegate:(id<UITextFieldDelegate>)self];
        [self.textField setFont:[UIFont systemFontOfSize:frame.size.height/2]];
        [self addSubview:self.textField];
        
        self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 0) style:UITableViewStylePlain];
        [self.tableView setDelegate:(id<UITableViewDelegate>)self];
        [self.tableView setDataSource:(id<UITableViewDataSource>)self];
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        [self.tableView.layer setBorderWidth:0.3];
        [self.tableView.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.tableView.layer setMasksToBounds:YES];
        [self.tableView.layer setShadowColor:[UIColor grayColor].CGColor];
        [self addSubview:self.tableView];
        [self.tableView setBackgroundView:nil];
        [self.tableView setBackgroundColor:[UIColor clearColor]];

        
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setBorderWidth:0.3];
        [self.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.layer setMasksToBounds:YES];
        [self.layer setShadowColor:[UIColor grayColor].CGColor];
        [self setClipsToBounds:NO];
        self.status=PullMenuStatus_diss;
        [self.tableView resignFirstResponder];
        
    }
    return self;
}
-(IBAction)buttonClick:(id)sender
{
    if (self.status==PullMenuStatus_show) {
        [self pullMenuDismiss];
    }
    else
    {
        [self pullMenuShow];
    }
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *v = [super hitTest:point withEvent:event];
    if (v == nil) {
        CGPoint tp = [self.tableView convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.tableView.bounds, tp)) {
            v = self.tableView;
        }
    }
    
    return v;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.status==PullMenuStatus_show) {
        [self pullMenuDismiss];
    }
    else
    {
        [self pullMenuShow];
    }
    return NO;
}
-(void)pullMenuShow
{
    [UIView animateWithDuration:0.2 animations:^{
        self.textField.rightView.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.tableView setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height*3)];
            self.status=PullMenuStatus_show;
        } completion:^(BOOL finished) {
           
        }];
    }];
}
-(void)pullMenuDismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        self.textField.rightView.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.tableView setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 0)];
            self.status=PullMenuStatus_diss;
        } completion:^(BOOL finished) {
            
        }];
    }];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"identity";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.data[indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self pullMenuDismiss];
    self.textField.text=self.data[indexPath.row];
}
@end
