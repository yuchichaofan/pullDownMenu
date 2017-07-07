//
//  YCMultiplePullDownMenu.m
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/7.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import "YCMultiplePullDownMenu.h"
#import "UIView+YZCategory.h"
@interface YCMultiplePullDownMenu()<YCPullDownMenuDelegate>
@property (nonatomic,strong)NSMutableArray<NSArray *> * menuDataArray;
@property (nonatomic,strong)NSArray<NSString *>* titleArray;
@property (nonatomic,strong)NSMutableArray <YCPullDownMenu *>* menuArray;
@end

@implementation YCMultiplePullDownMenu

-(instancetype)initWithFrame:(CGRect)frame menuDataArray:(NSArray *)menuDataArray titileArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        self.menuDataArray = [NSMutableArray arrayWithArray:menuDataArray];
        self.titleArray = [NSArray arrayWithArray:titleArray];
        self.menuArray = [NSMutableArray array];
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    NSInteger titileCount = self.titleArray.count;
    float width = self.width/titileCount;
    for (int i = 0; i<titileCount; i++) {
        CGRect rect = CGRectMake(width*i, 0, width, self.height);
        YCPullDownMenu * menu = [[YCPullDownMenu alloc]initWithFrame:rect title:self.titleArray[i] menuArray:self.menuDataArray[i]];
        [self addSubview:menu];
        menu.tag = i;
        menu.close = YES;
        menu.delegate = self;
        [self.menuArray addObject:menu];
    }
}
- (void)rushYCPullDownMenu:(NSDictionary *)dic
{
    NSInteger column = ((NSString *)dic[@"column"]).integerValue;
    NSInteger rows   = ((NSString *)dic[@"rows"]).integerValue;
    NSString * value = self.menuDataArray[column][rows];
    NSLog(@"value is %@",value);
    if (column + 1 < self.titleArray.count) {
        self.menuArray[column + 1].close = NO;
    }
}
- (void)setLinkSearch:(BOOL)linkSearch
{
    if (linkSearch) {
        self.menuArray[0].close = NO;
    }else
    {
        for (YCPullDownMenu * obj in self.menuArray) {
            obj.close = NO;
        }
    }
}
@end
