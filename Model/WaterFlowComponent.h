//
//  WaterFlowComponent.h
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaterFlowAction;

@interface WaterFlowComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *monthColor;
@property (nonatomic, strong) NSString *showId;
@property (nonatomic, strong) NSString *weekDayBgUrl;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *showTimeColor;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *xingQi;
@property (nonatomic, strong) NSString *backgroundUrl;
@property (nonatomic, strong) NSString *showTypeId;
@property (nonatomic, strong) NSString *weekDay;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *monthOnly;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) WaterFlowAction *action;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *forumId;
@property (nonatomic, strong) NSString *hasVideo;
@property (nonatomic, strong) NSString *componentIdentifier;
@property (nonatomic, strong) NSString *publishColor;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *itemsCount;
@property (nonatomic, strong) NSString *weekDayColor;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, strong) NSString *dayColor;
@property (nonatomic, strong) NSString *showType;
@property (nonatomic, strong) NSString *componentDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
