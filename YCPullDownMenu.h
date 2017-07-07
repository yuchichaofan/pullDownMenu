//
//  YCPullDownMenu.h
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/6.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCMenuButton.h"

@protocol YCPullDownMenuDelegate <NSObject>

- (void)rushYCPullDownMenu:(NSDictionary *)dic;

@end

@interface YCPullDownMenu : UIView

@property (nonatomic, strong) NSString * value;

@property (nonatomic, assign) BOOL  close;

@property (nonatomic, weak) id<YCPullDownMenuDelegate> delegate;


//单个下拉菜单
- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title menuArray:(NSArray *)array;

@end
