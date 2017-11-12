//
//  LocationInfoModel.h
//  geoSearching
//
//  Created by 陈川 on 2017/10/31.
//

#import <Foundation/Foundation.h>

@interface LocationInfoModel : NSObject

@property (nonatomic, copy) NSString *locTitle;

@property (nonatomic, copy) NSString *locLikeCount;

@property (nonatomic, copy) NSString *locDistance;

@property (nonatomic, copy) NSString *detailImage;

@property (nonatomic, copy) NSString *difficultyLevel;
@property (nonatomic, copy) NSString *rewardLevel;
@property (nonatomic, copy) NSString *locVisitedTimes;

@property (nonatomic, copy) NSString *locDescription;

@property (nonatomic, copy) NSString *posterName;
@property (nonatomic, copy) NSString *postDate;

@property (nonatomic, assign) NSInteger detailType;

@property (nonatomic, strong) NSString *number;

+ (instancetype)randomModel;

+ (instancetype)modelWithTitle:(NSString *)title;

@end
