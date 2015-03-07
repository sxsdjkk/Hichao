//
//  WaterFlowItems.h
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaterFlowComponent;

@interface WaterFlowItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WaterFlowComponent *component;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
