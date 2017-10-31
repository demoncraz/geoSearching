//
//  UIView+Frame.m
//  qtec_app
//
//  Created by 陈川 on 2017/6/6.
//  Copyright © 2017年 陈川. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)CC_x {
    return self.frame.origin.x;
}

- (void)setCC_x:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)CC_y {
    return self.frame.origin.y;
}

- (void)setCC_y:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)CC_width {
    return self.frame.size.width;
}

- (void)setCC_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)CC_height {
    return self.frame.size.height;
}

- (void)setCC_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)CC_centerX {
    return self.center.x;
}

- (void)setCC_centerX:(CGFloat)centerX {
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

- (CGFloat)CC_centerY {
    return self.center.y;
}

- (void)setCC_centerY:(CGFloat)centerY {
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}


@end
