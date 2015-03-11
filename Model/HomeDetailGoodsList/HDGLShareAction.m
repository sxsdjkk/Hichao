//
//  HDGLShareAction.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLShareAction.h"
#import "HDGLShare.h"


NSString *const kHDGLShareActionShare = @"share";
NSString *const kHDGLShareActionActionType = @"actionType";


@interface HDGLShareAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLShareAction

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
            self.share = [HDGLShare modelObjectWithDictionary:[dict objectForKey:kHDGLShareActionShare]];
            self.actionType = [self objectOrNilForKey:kHDGLShareActionActionType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.share dictionaryRepresentation] forKey:kHDGLShareActionShare];
    [mutableDict setValue:self.actionType forKey:kHDGLShareActionActionType];

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

    self.share = [aDecoder decodeObjectForKey:kHDGLShareActionShare];
    self.actionType = [aDecoder decodeObjectForKey:kHDGLShareActionActionType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_share forKey:kHDGLShareActionShare];
    [aCoder encodeObject:_actionType forKey:kHDGLShareActionActionType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLShareAction *copy = [[HDGLShareAction alloc] init];
    
    if (copy) {

        copy.share = [self.share copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_share release];
    [_actionType release];
    [super dealloc];
}

@end
