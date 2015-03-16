//
//  SkuShareAction.m
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SkuShareAction.h"
#import "SkuShare.h"


NSString *const kSkuShareActionShare = @"share";
NSString *const kSkuShareActionActionType = @"actionType";


@interface SkuShareAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SkuShareAction

@synthesize share = _share;
@synthesize actionType = _actionType;


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
            self.share = [SkuShare modelObjectWithDictionary:[dict objectForKey:kSkuShareActionShare]];
            self.actionType = [self objectOrNilForKey:kSkuShareActionActionType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.share dictionaryRepresentation] forKey:kSkuShareActionShare];
    [mutableDict setValue:self.actionType forKey:kSkuShareActionActionType];

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

    self.share = [aDecoder decodeObjectForKey:kSkuShareActionShare];
    self.actionType = [aDecoder decodeObjectForKey:kSkuShareActionActionType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_share forKey:kSkuShareActionShare];
    [aCoder encodeObject:_actionType forKey:kSkuShareActionActionType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SkuShareAction *copy = [[SkuShareAction alloc] init];
    
    if (copy) {

        copy.share = [self.share copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
    }
    
    return copy;
}


@end
