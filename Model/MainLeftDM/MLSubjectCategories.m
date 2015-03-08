//
//  MLSubjectCategories.m
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MLSubjectCategories.h"


NSString *const kMLSubjectCategoriesCommentCount = @"commentCount";
NSString *const kMLSubjectCategoriesId = @"id";
NSString *const kMLSubjectCategoriesOnline = @"online";
NSString *const kMLSubjectCategoriesName = @"name";
NSString *const kMLSubjectCategoriesThreadCount = @"threadCount";
NSString *const kMLSubjectCategoriesPicUrl = @"picUrl";


@interface MLSubjectCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MLSubjectCategories

@synthesize commentCount = _commentCount;
@synthesize subjectCategoriesIdentifier = _subjectCategoriesIdentifier;
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
            self.commentCount = [self objectOrNilForKey:kMLSubjectCategoriesCommentCount fromDictionary:dict];
            self.subjectCategoriesIdentifier = [self objectOrNilForKey:kMLSubjectCategoriesId fromDictionary:dict];
            self.online = [self objectOrNilForKey:kMLSubjectCategoriesOnline fromDictionary:dict];
            self.name = [self objectOrNilForKey:kMLSubjectCategoriesName fromDictionary:dict];
            self.threadCount = [self objectOrNilForKey:kMLSubjectCategoriesThreadCount fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kMLSubjectCategoriesPicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commentCount forKey:kMLSubjectCategoriesCommentCount];
    [mutableDict setValue:self.subjectCategoriesIdentifier forKey:kMLSubjectCategoriesId];
    [mutableDict setValue:self.online forKey:kMLSubjectCategoriesOnline];
    [mutableDict setValue:self.name forKey:kMLSubjectCategoriesName];
    [mutableDict setValue:self.threadCount forKey:kMLSubjectCategoriesThreadCount];
    [mutableDict setValue:self.picUrl forKey:kMLSubjectCategoriesPicUrl];

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

    self.commentCount = [aDecoder decodeObjectForKey:kMLSubjectCategoriesCommentCount];
    self.subjectCategoriesIdentifier = [aDecoder decodeObjectForKey:kMLSubjectCategoriesId];
    self.online = [aDecoder decodeObjectForKey:kMLSubjectCategoriesOnline];
    self.name = [aDecoder decodeObjectForKey:kMLSubjectCategoriesName];
    self.threadCount = [aDecoder decodeObjectForKey:kMLSubjectCategoriesThreadCount];
    self.picUrl = [aDecoder decodeObjectForKey:kMLSubjectCategoriesPicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commentCount forKey:kMLSubjectCategoriesCommentCount];
    [aCoder encodeObject:_subjectCategoriesIdentifier forKey:kMLSubjectCategoriesId];
    [aCoder encodeObject:_online forKey:kMLSubjectCategoriesOnline];
    [aCoder encodeObject:_name forKey:kMLSubjectCategoriesName];
    [aCoder encodeObject:_threadCount forKey:kMLSubjectCategoriesThreadCount];
    [aCoder encodeObject:_picUrl forKey:kMLSubjectCategoriesPicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MLSubjectCategories *copy = [[MLSubjectCategories alloc] init];
    
    if (copy) {

        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.subjectCategoriesIdentifier = [self.subjectCategoriesIdentifier copyWithZone:zone];
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
    [_subjectCategoriesIdentifier release];
    [_online release];
    [_name release];
    [_threadCount release];
    [_picUrl release];
    [super dealloc];
}

@end
