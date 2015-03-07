//
//  WaterFlowComponent.m
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "WaterFlowComponent.h"
#import "WaterFlowAction.h"
#import "WaterFlowActions.h"


NSString *const kWaterFlowComponentMonthColor = @"monthColor";
NSString *const kWaterFlowComponentShowId = @"showId";
NSString *const kWaterFlowComponentWeekDayBgUrl = @"weekDayBgUrl";
NSString *const kWaterFlowComponentPicUrl = @"picUrl";
NSString *const kWaterFlowComponentShowTimeColor = @"showTimeColor";
NSString *const kWaterFlowComponentMonth = @"month";
NSString *const kWaterFlowComponentXingQi = @"xingQi";
NSString *const kWaterFlowComponentBackgroundUrl = @"backgroundUrl";
NSString *const kWaterFlowComponentShowTypeId = @"showTypeId";
NSString *const kWaterFlowComponentWeekDay = @"weekDay";
NSString *const kWaterFlowComponentComponentType = @"componentType";
NSString *const kWaterFlowComponentMonthOnly = @"monthOnly";
NSString *const kWaterFlowComponentDay = @"day";
NSString *const kWaterFlowComponentAction = @"action";
NSString *const kWaterFlowComponentYear = @"year";
NSString *const kWaterFlowComponentForumId = @"forumId";
NSString *const kWaterFlowComponentHasVideo = @"hasVideo";
NSString *const kWaterFlowComponentId = @"id";
NSString *const kWaterFlowComponentPublishColor = @"publishColor";
NSString *const kWaterFlowComponentShowTime = @"showTime";
NSString *const kWaterFlowComponentTrackValue = @"trackValue";
NSString *const kWaterFlowComponentItemsCount = @"itemsCount";
NSString *const kWaterFlowComponentWeekDayColor = @"weekDayColor";
NSString *const kWaterFlowComponentCollectionCount = @"collectionCount";
NSString *const kWaterFlowComponentCommentCount = @"commentCount";
NSString *const kWaterFlowComponentActions = @"actions";
NSString *const kWaterFlowComponentDayColor = @"dayColor";
NSString *const kWaterFlowComponentShowType = @"showType";
NSString *const kWaterFlowComponentDescription = @"description";


@interface WaterFlowComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WaterFlowComponent

@synthesize monthColor = _monthColor;
@synthesize showId = _showId;
@synthesize weekDayBgUrl = _weekDayBgUrl;
@synthesize picUrl = _picUrl;
@synthesize showTimeColor = _showTimeColor;
@synthesize month = _month;
@synthesize xingQi = _xingQi;
@synthesize backgroundUrl = _backgroundUrl;
@synthesize showTypeId = _showTypeId;
@synthesize weekDay = _weekDay;
@synthesize componentType = _componentType;
@synthesize monthOnly = _monthOnly;
@synthesize day = _day;
@synthesize action = _action;
@synthesize year = _year;
@synthesize forumId = _forumId;
@synthesize hasVideo = _hasVideo;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize publishColor = _publishColor;
@synthesize showTime = _showTime;
@synthesize trackValue = _trackValue;
@synthesize itemsCount = _itemsCount;
@synthesize weekDayColor = _weekDayColor;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;
@synthesize actions = _actions;
@synthesize dayColor = _dayColor;
@synthesize showType = _showType;
@synthesize componentDescription = _componentDescription;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.monthColor = [self objectOrNilForKey:kWaterFlowComponentMonthColor fromDictionary:dict];
            self.showId = [self objectOrNilForKey:kWaterFlowComponentShowId fromDictionary:dict];
            self.weekDayBgUrl = [self objectOrNilForKey:kWaterFlowComponentWeekDayBgUrl fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kWaterFlowComponentPicUrl fromDictionary:dict];
            self.showTimeColor = [self objectOrNilForKey:kWaterFlowComponentShowTimeColor fromDictionary:dict];
            self.month = [self objectOrNilForKey:kWaterFlowComponentMonth fromDictionary:dict];
            self.xingQi = [self objectOrNilForKey:kWaterFlowComponentXingQi fromDictionary:dict];
            self.backgroundUrl = [self objectOrNilForKey:kWaterFlowComponentBackgroundUrl fromDictionary:dict];
            self.showTypeId = [self objectOrNilForKey:kWaterFlowComponentShowTypeId fromDictionary:dict];
            self.weekDay = [self objectOrNilForKey:kWaterFlowComponentWeekDay fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kWaterFlowComponentComponentType fromDictionary:dict];
            self.monthOnly = [self objectOrNilForKey:kWaterFlowComponentMonthOnly fromDictionary:dict];
            self.day = [self objectOrNilForKey:kWaterFlowComponentDay fromDictionary:dict];
            self.action = [WaterFlowAction modelObjectWithDictionary:[dict objectForKey:kWaterFlowComponentAction]];
            self.year = [self objectOrNilForKey:kWaterFlowComponentYear fromDictionary:dict];
            self.forumId = [self objectOrNilForKey:kWaterFlowComponentForumId fromDictionary:dict];
            self.hasVideo = [self objectOrNilForKey:kWaterFlowComponentHasVideo fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kWaterFlowComponentId fromDictionary:dict];
            self.publishColor = [self objectOrNilForKey:kWaterFlowComponentPublishColor fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kWaterFlowComponentShowTime fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kWaterFlowComponentTrackValue fromDictionary:dict];
            self.itemsCount = [self objectOrNilForKey:kWaterFlowComponentItemsCount fromDictionary:dict];
            self.weekDayColor = [self objectOrNilForKey:kWaterFlowComponentWeekDayColor fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kWaterFlowComponentCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kWaterFlowComponentCommentCount fromDictionary:dict];
    NSObject *receivedWaterFlowActions = [dict objectForKey:kWaterFlowComponentActions];
    NSMutableArray *parsedWaterFlowActions = [NSMutableArray array];
    if ([receivedWaterFlowActions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWaterFlowActions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWaterFlowActions addObject:[WaterFlowActions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWaterFlowActions isKindOfClass:[NSDictionary class]]) {
       [parsedWaterFlowActions addObject:[WaterFlowActions modelObjectWithDictionary:(NSDictionary *)receivedWaterFlowActions]];
    }

    self.actions = [NSArray arrayWithArray:parsedWaterFlowActions];
            self.dayColor = [self objectOrNilForKey:kWaterFlowComponentDayColor fromDictionary:dict];
            self.showType = [self objectOrNilForKey:kWaterFlowComponentShowType fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kWaterFlowComponentDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.monthColor forKey:kWaterFlowComponentMonthColor];
    [mutableDict setValue:self.showId forKey:kWaterFlowComponentShowId];
    [mutableDict setValue:self.weekDayBgUrl forKey:kWaterFlowComponentWeekDayBgUrl];
    [mutableDict setValue:self.picUrl forKey:kWaterFlowComponentPicUrl];
    [mutableDict setValue:self.showTimeColor forKey:kWaterFlowComponentShowTimeColor];
    [mutableDict setValue:self.month forKey:kWaterFlowComponentMonth];
    [mutableDict setValue:self.xingQi forKey:kWaterFlowComponentXingQi];
    [mutableDict setValue:self.backgroundUrl forKey:kWaterFlowComponentBackgroundUrl];
    [mutableDict setValue:self.showTypeId forKey:kWaterFlowComponentShowTypeId];
    [mutableDict setValue:self.weekDay forKey:kWaterFlowComponentWeekDay];
    [mutableDict setValue:self.componentType forKey:kWaterFlowComponentComponentType];
    [mutableDict setValue:self.monthOnly forKey:kWaterFlowComponentMonthOnly];
    [mutableDict setValue:self.day forKey:kWaterFlowComponentDay];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kWaterFlowComponentAction];
    [mutableDict setValue:self.year forKey:kWaterFlowComponentYear];
    [mutableDict setValue:self.forumId forKey:kWaterFlowComponentForumId];
    [mutableDict setValue:self.hasVideo forKey:kWaterFlowComponentHasVideo];
    [mutableDict setValue:self.componentIdentifier forKey:kWaterFlowComponentId];
    [mutableDict setValue:self.publishColor forKey:kWaterFlowComponentPublishColor];
    [mutableDict setValue:self.showTime forKey:kWaterFlowComponentShowTime];
    [mutableDict setValue:self.trackValue forKey:kWaterFlowComponentTrackValue];
    [mutableDict setValue:self.itemsCount forKey:kWaterFlowComponentItemsCount];
    [mutableDict setValue:self.weekDayColor forKey:kWaterFlowComponentWeekDayColor];
    [mutableDict setValue:self.collectionCount forKey:kWaterFlowComponentCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kWaterFlowComponentCommentCount];
    NSMutableArray *tempArrayForActions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.actions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActions] forKey:kWaterFlowComponentActions];
    [mutableDict setValue:self.dayColor forKey:kWaterFlowComponentDayColor];
    [mutableDict setValue:self.showType forKey:kWaterFlowComponentShowType];
    [mutableDict setValue:self.componentDescription forKey:kWaterFlowComponentDescription];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.monthColor = [aDecoder decodeObjectForKey:kWaterFlowComponentMonthColor];
    self.showId = [aDecoder decodeObjectForKey:kWaterFlowComponentShowId];
    self.weekDayBgUrl = [aDecoder decodeObjectForKey:kWaterFlowComponentWeekDayBgUrl];
    self.picUrl = [aDecoder decodeObjectForKey:kWaterFlowComponentPicUrl];
    self.showTimeColor = [aDecoder decodeObjectForKey:kWaterFlowComponentShowTimeColor];
    self.month = [aDecoder decodeObjectForKey:kWaterFlowComponentMonth];
    self.xingQi = [aDecoder decodeObjectForKey:kWaterFlowComponentXingQi];
    self.backgroundUrl = [aDecoder decodeObjectForKey:kWaterFlowComponentBackgroundUrl];
    self.showTypeId = [aDecoder decodeObjectForKey:kWaterFlowComponentShowTypeId];
    self.weekDay = [aDecoder decodeObjectForKey:kWaterFlowComponentWeekDay];
    self.componentType = [aDecoder decodeObjectForKey:kWaterFlowComponentComponentType];
    self.monthOnly = [aDecoder decodeObjectForKey:kWaterFlowComponentMonthOnly];
    self.day = [aDecoder decodeObjectForKey:kWaterFlowComponentDay];
    self.action = [aDecoder decodeObjectForKey:kWaterFlowComponentAction];
    self.year = [aDecoder decodeObjectForKey:kWaterFlowComponentYear];
    self.forumId = [aDecoder decodeObjectForKey:kWaterFlowComponentForumId];
    self.hasVideo = [aDecoder decodeObjectForKey:kWaterFlowComponentHasVideo];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kWaterFlowComponentId];
    self.publishColor = [aDecoder decodeObjectForKey:kWaterFlowComponentPublishColor];
    self.showTime = [aDecoder decodeObjectForKey:kWaterFlowComponentShowTime];
    self.trackValue = [aDecoder decodeObjectForKey:kWaterFlowComponentTrackValue];
    self.itemsCount = [aDecoder decodeObjectForKey:kWaterFlowComponentItemsCount];
    self.weekDayColor = [aDecoder decodeObjectForKey:kWaterFlowComponentWeekDayColor];
    self.collectionCount = [aDecoder decodeObjectForKey:kWaterFlowComponentCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kWaterFlowComponentCommentCount];
    self.actions = [aDecoder decodeObjectForKey:kWaterFlowComponentActions];
    self.dayColor = [aDecoder decodeObjectForKey:kWaterFlowComponentDayColor];
    self.showType = [aDecoder decodeObjectForKey:kWaterFlowComponentShowType];
    self.componentDescription = [aDecoder decodeObjectForKey:kWaterFlowComponentDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_monthColor forKey:kWaterFlowComponentMonthColor];
    [aCoder encodeObject:_showId forKey:kWaterFlowComponentShowId];
    [aCoder encodeObject:_weekDayBgUrl forKey:kWaterFlowComponentWeekDayBgUrl];
    [aCoder encodeObject:_picUrl forKey:kWaterFlowComponentPicUrl];
    [aCoder encodeObject:_showTimeColor forKey:kWaterFlowComponentShowTimeColor];
    [aCoder encodeObject:_month forKey:kWaterFlowComponentMonth];
    [aCoder encodeObject:_xingQi forKey:kWaterFlowComponentXingQi];
    [aCoder encodeObject:_backgroundUrl forKey:kWaterFlowComponentBackgroundUrl];
    [aCoder encodeObject:_showTypeId forKey:kWaterFlowComponentShowTypeId];
    [aCoder encodeObject:_weekDay forKey:kWaterFlowComponentWeekDay];
    [aCoder encodeObject:_componentType forKey:kWaterFlowComponentComponentType];
    [aCoder encodeObject:_monthOnly forKey:kWaterFlowComponentMonthOnly];
    [aCoder encodeObject:_day forKey:kWaterFlowComponentDay];
    [aCoder encodeObject:_action forKey:kWaterFlowComponentAction];
    [aCoder encodeObject:_year forKey:kWaterFlowComponentYear];
    [aCoder encodeObject:_forumId forKey:kWaterFlowComponentForumId];
    [aCoder encodeObject:_hasVideo forKey:kWaterFlowComponentHasVideo];
    [aCoder encodeObject:_componentIdentifier forKey:kWaterFlowComponentId];
    [aCoder encodeObject:_publishColor forKey:kWaterFlowComponentPublishColor];
    [aCoder encodeObject:_showTime forKey:kWaterFlowComponentShowTime];
    [aCoder encodeObject:_trackValue forKey:kWaterFlowComponentTrackValue];
    [aCoder encodeObject:_itemsCount forKey:kWaterFlowComponentItemsCount];
    [aCoder encodeObject:_weekDayColor forKey:kWaterFlowComponentWeekDayColor];
    [aCoder encodeObject:_collectionCount forKey:kWaterFlowComponentCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kWaterFlowComponentCommentCount];
    [aCoder encodeObject:_actions forKey:kWaterFlowComponentActions];
    [aCoder encodeObject:_dayColor forKey:kWaterFlowComponentDayColor];
    [aCoder encodeObject:_showType forKey:kWaterFlowComponentShowType];
    [aCoder encodeObject:_componentDescription forKey:kWaterFlowComponentDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    WaterFlowComponent *copy = [[WaterFlowComponent alloc] init];
    
    if (copy) {

        copy.monthColor = [self.monthColor copyWithZone:zone];
        copy.showId = [self.showId copyWithZone:zone];
        copy.weekDayBgUrl = [self.weekDayBgUrl copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.showTimeColor = [self.showTimeColor copyWithZone:zone];
        copy.month = [self.month copyWithZone:zone];
        copy.xingQi = [self.xingQi copyWithZone:zone];
        copy.backgroundUrl = [self.backgroundUrl copyWithZone:zone];
        copy.showTypeId = [self.showTypeId copyWithZone:zone];
        copy.weekDay = [self.weekDay copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.monthOnly = [self.monthOnly copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.forumId = [self.forumId copyWithZone:zone];
        copy.hasVideo = [self.hasVideo copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.publishColor = [self.publishColor copyWithZone:zone];
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.itemsCount = [self.itemsCount copyWithZone:zone];
        copy.weekDayColor = [self.weekDayColor copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.actions = [self.actions copyWithZone:zone];
        copy.dayColor = [self.dayColor copyWithZone:zone];
        copy.showType = [self.showType copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
