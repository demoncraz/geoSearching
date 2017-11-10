//
//  DataManager.m
//  geoSearching
//
//  Created by demoncraz on 2017/11/10.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype)shared {
     static DataManager *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[DataManager alloc] init];
    });
    return shared;
}

@end
