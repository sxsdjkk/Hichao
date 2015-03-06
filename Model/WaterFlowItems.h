//
//  WaterFlowItems.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaterFlowComponent;

@interface WaterFlowItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) WaterFlowComponent *component;
@property (nonatomic, retain) NSString *timestamp;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
