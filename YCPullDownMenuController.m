//
//  YCPullDownMenuController.m
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/6.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import "YCPullDownMenuController.h"
#import "YCPullDownMenu.h"
#import "YCMultiplePullDownMenu.h"
@interface YCPullDownMenuController ()

@end

@implementation YCPullDownMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray * array = @[@"全部",@"录播课",@"直播课",@"线下课",@"全部",@"录播课",@"直播课",@"线下课",@"全部",@"录播课",@"直播课",@"线下课"];
    //单个下拉
    //    YCPullDownMenu * menu = [[YCPullDownMenu alloc]initWithFrame:CGRectMake(20, 20, 100, 300) title:@"年级" menuArray:array];
    //多个下拉
    NSMutableArray * dataArray = [NSMutableArray array];
    [dataArray addObject:array];
    [dataArray addObject:array];
    [dataArray addObject:array];
    NSArray * titleArray = @[@"年级",@"年龄",@"姓名"];
    YCMultiplePullDownMenu * menu = [[YCMultiplePullDownMenu alloc]initWithFrame:CGRectMake(20, 20, 300, 300) menuDataArray:dataArray titileArray:titleArray];
    menu.linkSearch = YES;
    [self.view addSubview:menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
