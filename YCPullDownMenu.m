//
//  YCPullDownMenu.m
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/6.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import "YCPullDownMenu.h"
#import "UIView+Frame.h"
#import "UIView+YZCategory.h"
static NSString * const ID = @"cell";

@interface YCPullDownMenu()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) YCMenuButton * menuButton;
@property (nonatomic, strong) UITableView  * myTableView;
@property (nonatomic, strong) NSArray      * menuArray;
@property (nonatomic, strong) NSString     * titleText;
@property (nonatomic, strong) NSArray      * titileArray;
@end

@implementation YCPullDownMenu

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title menuArray:(NSArray *)array
{
    if (self = [super initWithFrame:frame]) {
        self.menuArray = array;
        self.titleText = title;
        self.menuButton = [self getMenuButtonWithTitle];
        [self addSubview:self.menuButton];
        self.myTableView = [self getTableView];
        [self addSubview:self.myTableView];
    }
    return self;
}
-(UITableView *)getTableView
{
    CGRect rect = CGRectMake(0,self.menuButton.height, self.width,0);
    UITableView * tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    tableView.delegate = self;
    tableView.dataSource = self;
    return tableView;
}

- (YCMenuButton *)getMenuButtonWithTitle
{
    YCMenuButton *menuButton = [YCMenuButton buttonWithType:UIButtonTypeCustom];
    [menuButton setTitle:self.titleText forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [menuButton setImage:[UIImage imageNamed:@"arrow1"] forState:UIControlStateSelected];
    [menuButton setImage:[UIImage imageNamed:@"laba"] forState:UIControlStateDisabled];
    menuButton.layer.borderColor = [UIColor blackColor].CGColor;
    menuButton.layer.borderWidth = 1;
    menuButton.frame = CGRectMake(0, 0,self.bounds.size.width , 30);
    [menuButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return menuButton;
}
- (void)btnClick:(UIButton *)button
{
    NSLog(@"click");
    NSLog(@"selected is %d",button.selected);
    button.selected = !button.selected;
    NSLog(@"selected is %d",button.selected);
    if (button.selected == YES) {
        float height = self.height - self.menuButton.height;
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.myTableView.frame;
            frame.size.height = height;
            self.myTableView.frame = frame;
        }];
    }else
    {
        [self dismiss];
    }
}
- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.myTableView.frame;
        frame.size.height = 0;
        self.myTableView.frame = frame;
    }completion:^(BOOL finished) {
        self.menuButton.selected = NO;
    }];
}
-(void)setClose:(BOOL)close
{
    if (close) {
        self.menuButton.enabled = NO;
    }else
    {
        self.menuButton.enabled = YES;
    }
}
#pragma mark delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = self.menuArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismiss];
    [self.menuButton setTitle:self.menuArray[indexPath.row] forState:UIControlStateNormal];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSString stringWithFormat:@"%ld",(long)self.tag] forKey:@"column"];
    [dic  setObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row] forKey:@"rows"];
    if (self.delegate && [self.delegate respondsToSelector:@selector(rushYCPullDownMenu:)]) {
        [self.delegate rushYCPullDownMenu:dic];
    }
}

@end
