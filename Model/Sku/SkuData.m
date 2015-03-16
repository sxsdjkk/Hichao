//
//  SkuData.m
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SkuData.h"
#import "SkuShareAction.h"
#import "SkuTitleStyle.h"


NSString *const kSkuDataId = @"id";
NSString *const kSkuDataTrackValue = @"trackValue";
NSString *const kSkuDataDescription = @"description";
NSString *const kSkuDataChannel = @"channel";
NSString *const kSkuDataWidth = @"width";
NSString *const kSkuDataLink = @"link";
NSString *const kSkuDataSource = @"source";
NSString *const kSkuDataShareAction = @"shareAction";
NSString *const kSkuDataPrice = @"price";
NSString *const kSkuDataCollectionCount = @"collectionCount";
NSString *const kSkuDataSourceId = @"source_id";
NSString *const kSkuDataHeight = @"height";
NSString *const kSkuDataAppApi = @"appApi";
NSString *const kSkuDataNormalPicUrl = @"normalPicUrl";
NSString *const kSkuDataOriginLink = @"originLink";
NSString *const kSkuDataTitleStyle = @"titleStyle";


@interface SkuData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SkuData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize trackValue = _trackValue;
@synthesize dataDescription = _dataDescription;
@synthesize channel = _channel;
@synthesize width = _width;
@synthesize link = _link;
@synthesize source = _source;
@synthesize shareAction = _shareAction;
@synthesize price = _price;
@synthesize collectionCount = _collectionCount;
@synthesize sourceId = _sourceId;
@synthesize height = _height;
@synthesize appApi = _appApi;
@synthesize normalPicUrl = _normalPicUrl;
@synthesize originLink = _originLink;
@synthesize titleStyle = _titleStyle;


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
            self.dataIdentifier = [self objectOrNilForKey:kSkuDataId fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kSkuDataTrackValue fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kSkuDataDescription fromDictionary:dict];
            self.channel = [self objectOrNilForKey:kSkuDataChannel fromDictionary:dict];
            self.width = [self objectOrNilForKey:kSkuDataWidth fromDictionary:dict];
            self.link = [self objectOrNilForKey:kSkuDataLink fromDictionary:dict];
            self.source = [self objectOrNilForKey:kSkuDataSource fromDictionary:dict];
            self.shareAction = [SkuShareAction modelObjectWithDictionary:[dict objectForKey:kSkuDataShareAction]];
            self.price = [self objectOrNilForKey:kSkuDataPrice fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kSkuDataCollectionCount fromDictionary:dict];
            self.sourceId = [self objectOrNilForKey:kSkuDataSourceId fromDictionary:dict];
            self.height = [self objectOrNilForKey:kSkuDataHeight fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kSkuDataAppApi fromDictionary:dict];
            self.normalPicUrl = [self objectOrNilForKey:kSkuDataNormalPicUrl fromDictionary:dict];
            self.originLink = [self objectOrNilForKey:kSkuDataOriginLink fromDictionary:dict];
            self.titleStyle = [SkuTitleStyle modelObjectWithDictionary:[dict objectForKey:kSkuDataTitleStyle]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kSkuDataId];
    [mutableDict setValue:self.trackValue forKey:kSkuDataTrackValue];
    [mutableDict setValue:self.dataDescription forKey:kSkuDataDescription];
    [mutableDict setValue:self.channel forKey:kSkuDataChannel];
    [mutableDict setValue:self.width forKey:kSkuDataWidth];
    [mutableDict setValue:self.link forKey:kSkuDataLink];
    [mutableDict setValue:self.source forKey:kSkuDataSource];
    [mutableDict setValue:[self.shareAction dictionaryRepresentation] forKey:kSkuDataShareAction];
    [mutableDict setValue:self.price forKey:kSkuDataPrice];
    [mutableDict setValue:self.collectionCount forKey:kSkuDataCollectionCount];
    [mutableDict setValue:self.sourceId forKey:kSkuDataSourceId];
    [mutableDict setValue:self.height forKey:kSkuDataHeight];
    [mutableDict setValue:self.appApi forKey:kSkuDataAppApi];
    [mutableDict setValue:self.normalPicUrl forKey:kSkuDataNormalPicUrl];
    [mutableDict setValue:self.originLink forKey:kSkuDataOriginLink];
    [mutableDict setValue:[self.titleStyle dictionaryRepresentation] forKey:kSkuDataTitleStyle];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kSkuDataId];
    self.trackValue = [aDecoder decodeObjectForKey:kSkuDataTrackValue];
    self.dataDescription = [aDecoder decodeObjectForKey:kSkuDataDescription];
    self.channel = [aDecoder decodeObjectForKey:kSkuDataChannel];
    self.width = [aDecoder decodeObjectForKey:kSkuDataWidth];
    self.link = [aDecoder decodeObjectForKey:kSkuDataLink];
    self.source = [aDecoder decodeObjectForKey:kSkuDataSource];
    self.shareAction = [aDecoder decodeObjectForKey:kSkuDataShareAction];
    self.price = [aDecoder decodeObjectForKey:kSkuDataPrice];
    self.collectionCount = [aDecoder decodeObjectForKey:kSkuDataCollectionCount];
    self.sourceId = [aDecoder decodeObjectForKey:kSkuDataSourceId];
    self.height = [aDecoder decodeObjectForKey:kSkuDataHeight];
    self.appApi = [aDecoder decodeObjectForKey:kSkuDataAppApi];
    self.normalPicUrl = [aDecoder decodeObjectForKey:kSkuDataNormalPicUrl];
    self.originLink = [aDecoder decodeObjectForKey:kSkuDataOriginLink];
    self.titleStyle = [aDecoder decodeObjectForKey:kSkuDataTitleStyle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kSkuDataId];
    [aCoder encodeObject:_trackValue forKey:kSkuDataTrackValue];
    [aCoder encodeObject:_dataDescription forKey:kSkuDataDescription];
    [aCoder encodeObject:_channel forKey:kSkuDataChannel];
    [aCoder encodeObject:_width forKey:kSkuDataWidth];
    [aCoder encodeObject:_link forKey:kSkuDataLink];
    [aCoder encodeObject:_source forKey:kSkuDataSource];
    [aCoder encodeObject:_shareAction forKey:kSkuDataShareAction];
    [aCoder encodeObject:_price forKey:kSkuDataPrice];
    [aCoder encodeObject:_collectionCount forKey:kSkuDataCollectionCount];
    [aCoder encodeObject:_sourceId forKey:kSkuDataSourceId];
    [aCoder encodeObject:_height forKey:kSkuDataHeight];
    [aCoder encodeObject:_appApi forKey:kSkuDataAppApi];
    [aCoder encodeObject:_normalPicUrl forKey:kSkuDataNormalPicUrl];
    [aCoder encodeObject:_originLink forKey:kSkuDataOriginLink];
    [aCoder encodeObject:_titleStyle forKey:kSkuDataTitleStyle];
}

- (id)copyWithZone:(NSZone *)zone
{
    SkuData *copy = [[SkuData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.channel = [self.channel copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.shareAction = [self.shareAction copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.sourceId = [self.sourceId copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
        copy.normalPicUrl = [self.normalPicUrl copyWithZone:zone];
        copy.originLink = [self.originLink copyWithZone:zone];
        copy.titleStyle = [self.titleStyle copyWithZone:zone];
    }
    
    return copy;
}


@end
