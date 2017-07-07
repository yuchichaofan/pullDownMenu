//
//  YCMenuButton.m
//  TestBlock
//
//  Created by yuchichaofan on 2017/7/6.
//  Copyright © 2017年 yuchichaofan. All rights reserved.
//

#import "YCMenuButton.h"
#import "UIView+YZCategory.h"
@implementation YCMenuButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = self.titleLabel.maxX + 10;
    }
    
    
    
}

@end
