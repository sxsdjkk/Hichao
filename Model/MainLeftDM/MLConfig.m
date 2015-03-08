//
//  MLConfig.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLConfig.h"
#import "MLMobileTopicCategories.h"
#import "MLTopicCategories.h"
#import "MLMobileSubjectCategories.h"
#import "MLVItemStarCategories.h"
#import "MLCountly.h"
#import "MLStarCategories.h"
#import "MLSubjectCategories.h"


NSString *const kMLConfigSubjectCategoryDefault = @"subjectCategoryDefault";
NSString *const kMLConfigIgnoreCpsPrefix = @"ignoreCpsPrefix";
NSString *const kMLConfigUnixtime = @"unixtime";
NSString *const kMLConfigStarCategoryUI = @"starCategoryUI";
NSString *const kMLConfigStarCategoryDefault = @"starCategoryDefault";
NSString *const kMLConfigMobileTopicCategories = @"mobileTopicCategories";
NSString *const kMLConfigTopicCategoryUI = @"topicCategoryUI";
NSString *const kMLConfigTopicCategories = @"topicCategories";
NSString *const kMLConfigSubjectCategoryUI = @"subjectCategoryUI";
NSString *const kMLConfigMobileSubjectCategories = @"mobileSubjectCategories";
NSString *const kMLConfigVItemStarCategories = @"vItemStarCategories";
NSString *const kMLConfigShowBanner = @"showBanner";
NSString *const kMLConfigWebAdBlocker = @"webAdBlocker";
NSString *const kMLConfigShowSkuImgs = @"showSkuImgs";
NSString *const kMLConfigVersion = @"version";
NSString *const kMLConfigCountly = @"countly";
NSString *const kMLConfigTopicCategoryDefault = @"topicCategoryDefault";
NSString *const kMLConfigShowTimer = @"showTimer";
NSString *const kMLConfigStarCategories = @"starCategories";
NSString *const kMLConfigSubjectCategories = @"subjectCategories";
NSString *const kMLConfigLadyDuration = @"lady_duration";


@interface MLConfig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLConfig

@synthesize subjectCategoryDefault = _subjectCategoryDefault;
@synthesize ignoreCpsPrefix = _ignoreCpsPrefix;
@synthesize unixtime = _unixtime;
@synthesize starCategoryUI = _starCategoryUI;
@synthesize starCategoryDefault = _starCategoryDefault;
@synthesize mobileTopicCategories = _mobileTopicCategories;
@synthesize topicCategoryUI = _topicCategoryUI;
@synthesize topicCategories = _topicCategories;
@synthesize subjectCategoryUI = _subjectCategoryUI;
@synthesize mobileSubjectCategories = _mobileSubjectCategories;
@synthesize vItemStarCategories = _vItemStarCategories;
@synthesize showBanner = _showBanner;
@synthesize webAdBlocker = _webAdBlocker;
@synthesize showSkuImgs = _showSkuImgs;
@synthesize version = _version;
@synthesize countly = _countly;
@synthesize topicCategoryDefault = _topicCategoryDefault;
@synthesize showTimer = _showTimer;
@synthesize starCategories = _starCategories;
@synthesize subjectCategories = _subjectCategories;
@synthesize ladyDuration = _ladyDuration;


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
            self.subjectCategoryDefault = [self objectOrNilForKey:kMLConfigSubjectCategoryDefault fromDictionary:dict];
            self.ignoreCpsPrefix = [self objectOrNilForKey:kMLConfigIgnoreCpsPrefix fromDictionary:dict];
            self.unixtime = [self objectOrNilForKey:kMLConfigUnixtime fromDictionary:dict];
            self.starCategoryUI = [self objectOrNilForKey:kMLConfigStarCategoryUI fromDictionary:dict];
            self.starCategoryDefault = [self objectOrNilForKey:kMLConfigStarCategoryDefault fromDictionary:dict];
    NSObject *receivedMLMobileTopicCategories = [dict objectForKey:kMLConfigMobileTopicCategories];
    NSMutableArray *parsedMLMobileTopicCategories = [NSMutableArray array];
    if ([receivedMLMobileTopicCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLMobileTopicCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLMobileTopicCategories addObject:[MLMobileTopicCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLMobileTopicCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLMobileTopicCategories addObject:[MLMobileTopicCategories modelObjectWithDictionary:(NSDictionary *)receivedMLMobileTopicCategories]];
    }

    self.mobileTopicCategories = [NSArray arrayWithArray:parsedMLMobileTopicCategories];
            self.topicCategoryUI = [self objectOrNilForKey:kMLConfigTopicCategoryUI fromDictionary:dict];
    NSObject *receivedMLTopicCategories = [dict objectForKey:kMLConfigTopicCategories];
    NSMutableArray *parsedMLTopicCategories = [NSMutableArray array];
    if ([receivedMLTopicCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLTopicCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLTopicCategories addObject:[MLTopicCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLTopicCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLTopicCategories addObject:[MLTopicCategories modelObjectWithDictionary:(NSDictionary *)receivedMLTopicCategories]];
    }

    self.topicCategories = [NSArray arrayWithArray:parsedMLTopicCategories];
            self.subjectCategoryUI = [self objectOrNilForKey:kMLConfigSubjectCategoryUI fromDictionary:dict];
    NSObject *receivedMLMobileSubjectCategories = [dict objectForKey:kMLConfigMobileSubjectCategories];
    NSMutableArray *parsedMLMobileSubjectCategories = [NSMutableArray array];
    if ([receivedMLMobileSubjectCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLMobileSubjectCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLMobileSubjectCategories addObject:[MLMobileSubjectCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLMobileSubjectCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLMobileSubjectCategories addObject:[MLMobileSubjectCategories modelObjectWithDictionary:(NSDictionary *)receivedMLMobileSubjectCategories]];
    }

    self.mobileSubjectCategories = [NSArray arrayWithArray:parsedMLMobileSubjectCategories];
    NSObject *receivedMLVItemStarCategories = [dict objectForKey:kMLConfigVItemStarCategories];
    NSMutableArray *parsedMLVItemStarCategories = [NSMutableArray array];
    if ([receivedMLVItemStarCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLVItemStarCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLVItemStarCategories addObject:[MLVItemStarCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLVItemStarCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLVItemStarCategories addObject:[MLVItemStarCategories modelObjectWithDictionary:(NSDictionary *)receivedMLVItemStarCategories]];
    }

    self.vItemStarCategories = [NSArray arrayWithArray:parsedMLVItemStarCategories];
            self.showBanner = [self objectOrNilForKey:kMLConfigShowBanner fromDictionary:dict];
            self.webAdBlocker = [self objectOrNilForKey:kMLConfigWebAdBlocker fromDictionary:dict];
            self.showSkuImgs = [self objectOrNilForKey:kMLConfigShowSkuImgs fromDictionary:dict];
            self.version = [self objectOrNilForKey:kMLConfigVersion fromDictionary:dict];
            self.countly = [MLCountly modelObjectWithDictionary:[dict objectForKey:kMLConfigCountly]];
            self.topicCategoryDefault = [self objectOrNilForKey:kMLConfigTopicCategoryDefault fromDictionary:dict];
            self.showTimer = [self objectOrNilForKey:kMLConfigShowTimer fromDictionary:dict];
    NSObject *receivedMLStarCategories = [dict objectForKey:kMLConfigStarCategories];
    NSMutableArray *parsedMLStarCategories = [NSMutableArray array];
    if ([receivedMLStarCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLStarCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLStarCategories addObject:[MLStarCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLStarCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLStarCategories addObject:[MLStarCategories modelObjectWithDictionary:(NSDictionary *)receivedMLStarCategories]];
    }

    self.starCategories = [NSArray arrayWithArray:parsedMLStarCategories];
    NSObject *receivedMLSubjectCategories = [dict objectForKey:kMLConfigSubjectCategories];
    NSMutableArray *parsedMLSubjectCategories = [NSMutableArray array];
    if ([receivedMLSubjectCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMLSubjectCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMLSubjectCategories addObject:[MLSubjectCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMLSubjectCategories isKindOfClass:[NSDictionary class]]) {
       [parsedMLSubjectCategories addObject:[MLSubjectCategories modelObjectWithDictionary:(NSDictionary *)receivedMLSubjectCategories]];
    }

    self.subjectCategories = [NSArray arrayWithArray:parsedMLSubjectCategories];
            self.ladyDuration = [self objectOrNilForKey:kMLConfigLadyDuration fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subjectCategoryDefault forKey:kMLConfigSubjectCategoryDefault];
    NSMutableArray *tempArrayForIgnoreCpsPrefix = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ignoreCpsPrefix) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIgnoreCpsPrefix addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIgnoreCpsPrefix addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIgnoreCpsPrefix] forKey:kMLConfigIgnoreCpsPrefix];
    [mutableDict setValue:self.unixtime forKey:kMLConfigUnixtime];
    NSMutableArray *tempArrayForStarCategoryUI = [NSMutableArray array];
    for (NSObject *subArrayObject in self.starCategoryUI) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStarCategoryUI addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStarCategoryUI addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStarCategoryUI] forKey:kMLConfigStarCategoryUI];
    [mutableDict setValue:self.starCategoryDefault forKey:kMLConfigStarCategoryDefault];
    NSMutableArray *tempArrayForMobileTopicCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileTopicCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileTopicCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileTopicCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileTopicCategories] forKey:kMLConfigMobileTopicCategories];
    NSMutableArray *tempArrayForTopicCategoryUI = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topicCategoryUI) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopicCategoryUI addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopicCategoryUI addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopicCategoryUI] forKey:kMLConfigTopicCategoryUI];
    NSMutableArray *tempArrayForTopicCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topicCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopicCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopicCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopicCategories] forKey:kMLConfigTopicCategories];
    NSMutableArray *tempArrayForSubjectCategoryUI = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subjectCategoryUI) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubjectCategoryUI addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubjectCategoryUI addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubjectCategoryUI] forKey:kMLConfigSubjectCategoryUI];
    NSMutableArray *tempArrayForMobileSubjectCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mobileSubjectCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMobileSubjectCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMobileSubjectCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMobileSubjectCategories] forKey:kMLConfigMobileSubjectCategories];
    NSMutableArray *tempArrayForVItemStarCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.vItemStarCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVItemStarCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVItemStarCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVItemStarCategories] forKey:kMLConfigVItemStarCategories];
    NSMutableArray *tempArrayForShowBanner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.showBanner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForShowBanner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForShowBanner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForShowBanner] forKey:kMLConfigShowBanner];
    [mutableDict setValue:self.webAdBlocker forKey:kMLConfigWebAdBlocker];
    [mutableDict setValue:self.showSkuImgs forKey:kMLConfigShowSkuImgs];
    [mutableDict setValue:self.version forKey:kMLConfigVersion];
    [mutableDict setValue:[self.countly dictionaryRepresentation] forKey:kMLConfigCountly];
    [mutableDict setValue:self.topicCategoryDefault forKey:kMLConfigTopicCategoryDefault];
    NSMutableArray *tempArrayForShowTimer = [NSMutableArray array];
    for (NSObject *subArrayObject in self.showTimer) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForShowTimer addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForShowTimer addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForShowTimer] forKey:kMLConfigShowTimer];
    NSMutableArray *tempArrayForStarCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.starCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStarCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStarCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStarCategories] forKey:kMLConfigStarCategories];
    NSMutableArray *tempArrayForSubjectCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subjectCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubjectCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubjectCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubjectCategories] forKey:kMLConfigSubjectCategories];
    [mutableDict setValue:self.ladyDuration forKey:kMLConfigLadyDuration];

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

    self.subjectCategoryDefault = [aDecoder decodeObjectForKey:kMLConfigSubjectCategoryDefault];
    self.ignoreCpsPrefix = [aDecoder decodeObjectForKey:kMLConfigIgnoreCpsPrefix];
    self.unixtime = [aDecoder decodeObjectForKey:kMLConfigUnixtime];
    self.starCategoryUI = [aDecoder decodeObjectForKey:kMLConfigStarCategoryUI];
    self.starCategoryDefault = [aDecoder decodeObjectForKey:kMLConfigStarCategoryDefault];
    self.mobileTopicCategories = [aDecoder decodeObjectForKey:kMLConfigMobileTopicCategories];
    self.topicCategoryUI = [aDecoder decodeObjectForKey:kMLConfigTopicCategoryUI];
    self.topicCategories = [aDecoder decodeObjectForKey:kMLConfigTopicCategories];
    self.subjectCategoryUI = [aDecoder decodeObjectForKey:kMLConfigSubjectCategoryUI];
    self.mobileSubjectCategories = [aDecoder decodeObjectForKey:kMLConfigMobileSubjectCategories];
    self.vItemStarCategories = [aDecoder decodeObjectForKey:kMLConfigVItemStarCategories];
    self.showBanner = [aDecoder decodeObjectForKey:kMLConfigShowBanner];
    self.webAdBlocker = [aDecoder decodeObjectForKey:kMLConfigWebAdBlocker];
    self.showSkuImgs = [aDecoder decodeObjectForKey:kMLConfigShowSkuImgs];
    self.version = [aDecoder decodeObjectForKey:kMLConfigVersion];
    self.countly = [aDecoder decodeObjectForKey:kMLConfigCountly];
    self.topicCategoryDefault = [aDecoder decodeObjectForKey:kMLConfigTopicCategoryDefault];
    self.showTimer = [aDecoder decodeObjectForKey:kMLConfigShowTimer];
    self.starCategories = [aDecoder decodeObjectForKey:kMLConfigStarCategories];
    self.subjectCategories = [aDecoder decodeObjectForKey:kMLConfigSubjectCategories];
    self.ladyDuration = [aDecoder decodeObjectForKey:kMLConfigLadyDuration];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subjectCategoryDefault forKey:kMLConfigSubjectCategoryDefault];
    [aCoder encodeObject:_ignoreCpsPrefix forKey:kMLConfigIgnoreCpsPrefix];
    [aCoder encodeObject:_unixtime forKey:kMLConfigUnixtime];
    [aCoder encodeObject:_starCategoryUI forKey:kMLConfigStarCategoryUI];
    [aCoder encodeObject:_starCategoryDefault forKey:kMLConfigStarCategoryDefault];
    [aCoder encodeObject:_mobileTopicCategories forKey:kMLConfigMobileTopicCategories];
    [aCoder encodeObject:_topicCategoryUI forKey:kMLConfigTopicCategoryUI];
    [aCoder encodeObject:_topicCategories forKey:kMLConfigTopicCategories];
    [aCoder encodeObject:_subjectCategoryUI forKey:kMLConfigSubjectCategoryUI];
    [aCoder encodeObject:_mobileSubjectCategories forKey:kMLConfigMobileSubjectCategories];
    [aCoder encodeObject:_vItemStarCategories forKey:kMLConfigVItemStarCategories];
    [aCoder encodeObject:_showBanner forKey:kMLConfigShowBanner];
    [aCoder encodeObject:_webAdBlocker forKey:kMLConfigWebAdBlocker];
    [aCoder encodeObject:_showSkuImgs forKey:kMLConfigShowSkuImgs];
    [aCoder encodeObject:_version forKey:kMLConfigVersion];
    [aCoder encodeObject:_countly forKey:kMLConfigCountly];
    [aCoder encodeObject:_topicCategoryDefault forKey:kMLConfigTopicCategoryDefault];
    [aCoder encodeObject:_showTimer forKey:kMLConfigShowTimer];
    [aCoder encodeObject:_starCategories forKey:kMLConfigStarCategories];
    [aCoder encodeObject:_subjectCategories forKey:kMLConfigSubjectCategories];
    [aCoder encodeObject:_ladyDuration forKey:kMLConfigLadyDuration];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLConfig *copy = [[MLConfig alloc] init];
    
    if (copy) {

        copy.subjectCategoryDefault = [self.subjectCategoryDefault copyWithZone:zone];
        copy.ignoreCpsPrefix = [self.ignoreCpsPrefix copyWithZone:zone];
        copy.unixtime = [self.unixtime copyWithZone:zone];
        copy.starCategoryUI = [self.starCategoryUI copyWithZone:zone];
        copy.starCategoryDefault = [self.starCategoryDefault copyWithZone:zone];
        copy.mobileTopicCategories = [self.mobileTopicCategories copyWithZone:zone];
        copy.topicCategoryUI = [self.topicCategoryUI copyWithZone:zone];
        copy.topicCategories = [self.topicCategories copyWithZone:zone];
        copy.subjectCategoryUI = [self.subjectCategoryUI copyWithZone:zone];
        copy.mobileSubjectCategories = [self.mobileSubjectCategories copyWithZone:zone];
        copy.vItemStarCategories = [self.vItemStarCategories copyWithZone:zone];
        copy.showBanner = [self.showBanner copyWithZone:zone];
        copy.webAdBlocker = [self.webAdBlocker copyWithZone:zone];
        copy.showSkuImgs = [self.showSkuImgs copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
        copy.countly = [self.countly copyWithZone:zone];
        copy.topicCategoryDefault = [self.topicCategoryDefault copyWithZone:zone];
        copy.showTimer = [self.showTimer copyWithZone:zone];
        copy.starCategories = [self.starCategories copyWithZone:zone];
        copy.subjectCategories = [self.subjectCategories copyWithZone:zone];
        copy.ladyDuration = [self.ladyDuration copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_subjectCategoryDefault release];
    [_ignoreCpsPrefix release];
    [_unixtime release];
    [_starCategoryUI release];
    [_starCategoryDefault release];
    [_mobileTopicCategories release];
    [_topicCategoryUI release];
    [_topicCategories release];
    [_subjectCategoryUI release];
    [_mobileSubjectCategories release];
    [_vItemStarCategories release];
    [_showBanner release];
    [_webAdBlocker release];
    [_showSkuImgs release];
    [_version release];
    [_countly release];
    [_topicCategoryDefault release];
    [_showTimer release];
    [_starCategories release];
    [_subjectCategories release];
    [_ladyDuration release];
    [super dealloc];
}

@end
