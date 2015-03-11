//
//  HVCDData.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HVCDData.h"
#import "HVCDItemPicUrlList.h"
#import "HVCDItems.h"


NSString *const kHVCDDataId = @"id";
NSString *const kHVCDDataUserAvatar = @"userAvatar";
NSString *const kHVCDDataTrackValue = @"trackValue";
NSString *const kHVCDDataVideoUrl = @"videoUrl";
NSString *const kHVCDDataItemPicUrlList = @"itemPicUrlList";
NSString *const kHVCDDataPicUrl = @"picUrl";
NSString *const kHVCDDataDescription = @"description";
NSString *const kHVCDDataWidth = @"width";
NSString *const kHVCDDataUserName = @"userName";
NSString *const kHVCDDataCollectionCount = @"collectionCount";
NSString *const kHVCDDataHeight = @"height";
NSString *const kHVCDDataCommentCount = @"commentCount";
NSString *const kHVCDDataItems = @"items";
NSString *const kHVCDDataDateTime = @"dateTime";
NSString *const kHVCDDataAppApi = @"appApi";


@interface HVCDData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HVCDData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize userAvatar = _userAvatar;
@synthesize trackValue = _trackValue;
@synthesize videoUrl = _videoUrl;
@synthesize itemPicUrlList = _itemPicUrlList;
@synthesize picUrl = _picUrl;
@synthesize dataDescription = _dataDescription;
@synthesize width = _width;
@synthesize userName = _userName;
@synthesize collectionCount = _collectionCount;
@synthesize height = _height;
@synthesize commentCount = _commentCount;
@synthesize items = _items;
@synthesize dateTime = _dateTime;
@synthesize appApi = _appApi;


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
            self.dataIdentifier = [self objectOrNilForKey:kHVCDDataId fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kHVCDDataUserAvatar fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kHVCDDataTrackValue fromDictionary:dict];
            self.videoUrl = [self objectOrNilForKey:kHVCDDataVideoUrl fromDictionary:dict];
    NSObject *receivedHVCDItemPicUrlList = [dict objectForKey:kHVCDDataItemPicUrlList];
    NSMutableArray *parsedHVCDItemPicUrlList = [NSMutableArray array];
    if ([receivedHVCDItemPicUrlList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHVCDItemPicUrlList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHVCDItemPicUrlList addObject:[HVCDItemPicUrlList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHVCDItemPicUrlList isKindOfClass:[NSDictionary class]]) {
       [parsedHVCDItemPicUrlList addObject:[HVCDItemPicUrlList modelObjectWithDictionary:(NSDictionary *)receivedHVCDItemPicUrlList]];
    }

    self.itemPicUrlList = [NSArray arrayWithArray:parsedHVCDItemPicUrlList];
            self.picUrl = [self objectOrNilForKey:kHVCDDataPicUrl fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kHVCDDataDescription fromDictionary:dict];
            self.width = [self objectOrNilForKey:kHVCDDataWidth fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kHVCDDataUserName fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kHVCDDataCollectionCount fromDictionary:dict];
            self.height = [self objectOrNilForKey:kHVCDDataHeight fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kHVCDDataCommentCount fromDictionary:dict];
    NSObject *receivedHVCDItems = [dict objectForKey:kHVCDDataItems];
    NSMutableArray *parsedHVCDItems = [NSMutableArray array];
    if ([receivedHVCDItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHVCDItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHVCDItems addObject:[HVCDItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHVCDItems isKindOfClass:[NSDictionary class]]) {
       [parsedHVCDItems addObject:[HVCDItems modelObjectWithDictionary:(NSDictionary *)receivedHVCDItems]];
    }

    self.items = [NSArray arrayWithArray:parsedHVCDItems];
            self.dateTime = [self objectOrNilForKey:kHVCDDataDateTime fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kHVCDDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kHVCDDataId];
    [mutableDict setValue:self.userAvatar forKey:kHVCDDataUserAvatar];
    [mutableDict setValue:self.trackValue forKey:kHVCDDataTrackValue];
    [mutableDict setValue:self.videoUrl forKey:kHVCDDataVideoUrl];
    NSMutableArray *tempArrayForItemPicUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemPicUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemPicUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemPicUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemPicUrlList] forKey:kHVCDDataItemPicUrlList];
    [mutableDict setValue:self.picUrl forKey:kHVCDDataPicUrl];
    [mutableDict setValue:self.dataDescription forKey:kHVCDDataDescription];
    [mutableDict setValue:self.width forKey:kHVCDDataWidth];
    [mutableDict setValue:self.userName forKey:kHVCDDataUserName];
    [mutableDict setValue:self.collectionCount forKey:kHVCDDataCollectionCount];
    [mutableDict setValue:self.height forKey:kHVCDDataHeight];
    [mutableDict setValue:self.commentCount forKey:kHVCDDataCommentCount];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kHVCDDataItems];
    [mutableDict setValue:self.dateTime forKey:kHVCDDataDateTime];
    [mutableDict setValue:self.appApi forKey:kHVCDDataAppApi];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kHVCDDataId];
    self.userAvatar = [aDecoder decodeObjectForKey:kHVCDDataUserAvatar];
    self.trackValue = [aDecoder decodeObjectForKey:kHVCDDataTrackValue];
    self.videoUrl = [aDecoder decodeObjectForKey:kHVCDDataVideoUrl];
    self.itemPicUrlList = [aDecoder decodeObjectForKey:kHVCDDataItemPicUrlList];
    self.picUrl = [aDecoder decodeObjectForKey:kHVCDDataPicUrl];
    self.dataDescription = [aDecoder decodeObjectForKey:kHVCDDataDescription];
    self.width = [aDecoder decodeObjectForKey:kHVCDDataWidth];
    self.userName = [aDecoder decodeObjectForKey:kHVCDDataUserName];
    self.collectionCount = [aDecoder decodeObjectForKey:kHVCDDataCollectionCount];
    self.height = [aDecoder decodeObjectForKey:kHVCDDataHeight];
    self.commentCount = [aDecoder decodeObjectForKey:kHVCDDataCommentCount];
    self.items = [aDecoder decodeObjectForKey:kHVCDDataItems];
    self.dateTime = [aDecoder decodeObjectForKey:kHVCDDataDateTime];
    self.appApi = [aDecoder decodeObjectForKey:kHVCDDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kHVCDDataId];
    [aCoder encodeObject:_userAvatar forKey:kHVCDDataUserAvatar];
    [aCoder encodeObject:_trackValue forKey:kHVCDDataTrackValue];
    [aCoder encodeObject:_videoUrl forKey:kHVCDDataVideoUrl];
    [aCoder encodeObject:_itemPicUrlList forKey:kHVCDDataItemPicUrlList];
    [aCoder encodeObject:_picUrl forKey:kHVCDDataPicUrl];
    [aCoder encodeObject:_dataDescription forKey:kHVCDDataDescription];
    [aCoder encodeObject:_width forKey:kHVCDDataWidth];
    [aCoder encodeObject:_userName forKey:kHVCDDataUserName];
    [aCoder encodeObject:_collectionCount forKey:kHVCDDataCollectionCount];
    [aCoder encodeObject:_height forKey:kHVCDDataHeight];
    [aCoder encodeObject:_commentCount forKey:kHVCDDataCommentCount];
    [aCoder encodeObject:_items forKey:kHVCDDataItems];
    [aCoder encodeObject:_dateTime forKey:kHVCDDataDateTime];
    [aCoder encodeObject:_appApi forKey:kHVCDDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    HVCDData *copy = [[HVCDData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
        copy.itemPicUrlList = [self.itemPicUrlList copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.dateTime = [self.dateTime copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_dataIdentifier release];
    [_userAvatar release];
    [_trackValue release];
    [_videoUrl release];
    [_itemPicUrlList release];
    [_picUrl release];
    [_dataDescription release];
    [_width release];
    [_userName release];
    [_collectionCount release];
    [_height release];
    [_commentCount release];
    [_items release];
    [_dateTime release];
    [_appApi release];
    [super dealloc];
}

@end
