//
//  UIView+Frame.h
//  qtec_app
//
//  Created by 陈川 on 2017/6/6.
//  Copyright © 2017年 陈川. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (CGFloat)CC_x;
- (void)setCC_x:(CGFloat)x;

- (CGFloat)CC_y;
- (void)setCC_y:(CGFloat)y;

- (CGFloat)CC_width;
- (void)setCC_width:(CGFloat)width;

- (CGFloat)CC_height;
- (void)setCC_height:(CGFloat)height;

- (CGFloat)CC_centerX;
- (void)setCC_centerX:(CGFloat)centerX;

- (CGFloat)CC_centerY;
- (void)setCC_centerY:(CGFloat)centerY;

@end
