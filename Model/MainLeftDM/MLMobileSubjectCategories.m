//
//  MLMobileSubjectCategories.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLMobileSubjectCategories.h"


NSString *const kMLMobileSubjectCategoriesCommentCount = @"commentCount";
NSString *const kMLMobileSubjectCategoriesId = @"id";
NSString *const kMLMobileSubjectCategoriesOnline = @"online";
NSString *const kMLMobileSubjectCategoriesName = @"name";
NSString *const kMLMobileSubjectCategoriesThreadCount = @"threadCount";
NSString *const kMLMobileSubjectCategoriesPicUrl = @"picUrl";


@interface MLMobileSubjectCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLMobileSubjectCategories

@synthesize commentCount = _commentCount;
@synthesize mobileSubjectCategoriesIdentifier = _mobileSubjectCategoriesIdentifier;
@synthesize online = _online;
@synthesize name = _name;
@synthesize threadCount = _threadCount;
@synthesize picUrl = _picUrl;


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
            self.commentCount = [self objectOrNilForKey:kMLMobileSubjectCategoriesCommentCount fromDictionary:dict];
            self.mobileSubjectCategoriesIdentifier = [self objectOrNilForKey:kMLMobileSubjectCategoriesId fromDictionary:dict];
            self.online = [self objectOrNilForKey:kMLMobileSubjectCategoriesOnline fromDictionary:dict];
            self.name = [self objectOrNilForKey:kMLMobileSubjectCategoriesName fromDictionary:dict];
            self.threadCount = [self objectOrNilForKey:kMLMobileSubjectCategoriesThreadCount fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kMLMobileSubjectCategoriesPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commentCount forKey:kMLMobileSubjectCategoriesCommentCount];
    [mutableDict setValue:self.mobileSubjectCategoriesIdentifier forKey:kMLMobileSubjectCategoriesId];
    [mutableDict setValue:self.online forKey:kMLMobileSubjectCategoriesOnline];
    [mutableDict setValue:self.name forKey:kMLMobileSubjectCategoriesName];
    [mutableDict setValue:self.threadCount forKey:kMLMobileSubjectCategoriesThreadCount];
    [mutableDict setValue:self.picUrl forKey:kMLMobileSubjectCategoriesPicUrl];

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

    self.commentCount = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesCommentCount];
    self.mobileSubjectCategoriesIdentifier = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesId];
    self.online = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesOnline];
    self.name = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesName];
    self.threadCount = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesThreadCount];
    self.picUrl = [aDecoder decodeObjectForKey:kMLMobileSubjectCategoriesPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commentCount forKey:kMLMobileSubjectCategoriesCommentCount];
    [aCoder encodeObject:_mobileSubjectCategoriesIdentifier forKey:kMLMobileSubjectCategoriesId];
    [aCoder encodeObject:_online forKey:kMLMobileSubjectCategoriesOnline];
    [aCoder encodeObject:_name forKey:kMLMobileSubjectCategoriesName];
    [aCoder encodeObject:_threadCount forKey:kMLMobileSubjectCategoriesThreadCount];
    [aCoder encodeObject:_picUrl forKey:kMLMobileSubjectCategoriesPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLMobileSubjectCategories *copy = [[MLMobileSubjectCategories alloc] init];
    
    if (copy) {

        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.mobileSubjectCategoriesIdentifier = [self.mobileSubjectCategoriesIdentifier copyWithZone:zone];
        copy.online = [self.online copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.threadCount = [self.threadCount copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_commentCount release];
    [_mobileSubjectCategoriesIdentifier release];
    [_online release];
    [_name release];
    [_threadCount release];
    [_picUrl release];
    [super dealloc];
}

@end
