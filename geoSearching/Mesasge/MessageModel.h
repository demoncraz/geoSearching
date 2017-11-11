//
//  MessageModel.h
//  geoSearching
//
//  Created by demoncraz on 2017/11/11.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *content;

+ (instancetype)modelWithName:(NSString *)name content:(NSString *)content icon:(NSString *)icon;

@end
