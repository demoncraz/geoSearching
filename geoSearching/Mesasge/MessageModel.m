//
//  MessageModel.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/11.
//

#import "MessageModel.h"

@implementation MessageModel

+ (instancetype)modelWithName:(NSString *)name content:(NSString *)content icon:(NSString *)icon {
    MessageModel *model = [[MessageModel alloc] init];
    model.name = name;
    model.content = content;
    model.icon = icon;
    return model;
}

@end
