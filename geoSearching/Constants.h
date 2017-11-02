//
//  Constants.h
//  geoSearching
//
//  Created by demoncraz on 2017/10/31.
//

#import <Foundation/Foundation.h>
#import "UIView+Frame.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define ColorWithWhite(w) [UIColor colorWithRed:(w / 255.0) green:(w / 255.0) blue:(w / 255.0) alpha:1]
#define DefaultBlueColor ColorWithRGB(33,150,243,1)

#define DefineWeakSelf __weak typeof(self) weakSelf = self

@interface Constants : NSObject

@end
