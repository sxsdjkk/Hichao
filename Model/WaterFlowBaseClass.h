//
//  WaterFlowBaseClass.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaterFlowData;

@interface WaterFlowBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) WaterFlowData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
