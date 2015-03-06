//
//  WaterFlowComponent.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaterFlowAction;

@interface WaterFlowComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) WaterFlowAction *action;
@property (nonatomic, retain) NSString *itemsCount;
@property (nonatomic, retain) NSString *componentType;
@property (nonatomic, retain) NSString *hasVideo;
@property (nonatomic, retain) NSString *componentIdentifier;
@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *trackValue;
@property (nonatomic, retain) NSString *componentDescription;
@property (nonatomic, retain) NSString *collectionCount;
@property (nonatomic, retain) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
