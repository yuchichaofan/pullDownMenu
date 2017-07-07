//
//  YCMultiplePullDownMenu.h
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/7.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCPullDownMenu.h"
@interface YCMultiplePullDownMenu : UIView
@property (nonatomic, assign) BOOL  linkSearch;
- (instancetype)initWithFrame:(CGRect)frame menuDataArray:(NSArray*)menuDataArray titileArray:(NSArray *)titleArray;
@end
