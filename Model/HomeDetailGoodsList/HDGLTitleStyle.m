//
//  HDGLTitleStyle.m
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "HDGLTitleStyle.h"


NSString *const kHDGLTitleStylePicUrl = @"picUrl";
NSString *const kHDGLTitleStyleText = @"text";
NSString *const kHDGLTitleStyleFontColor = @"fontColor";


@interface HDGLTitleStyle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HDGLTitleStyle

@synthesize picUrl = _picUrl;
@synthesize text = _text;
@synthesize fontColor = _fontColor;


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
            self.picUrl = [self objectOrNilForKey:kHDGLTitleStylePicUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kHDGLTitleStyleText fromDictionary:dict];
            self.fontColor = [self objectOrNilForKey:kHDGLTitleStyleFontColor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kHDGLTitleStylePicUrl];
    [mutableDict setValue:self.text forKey:kHDGLTitleStyleText];
    [mutableDict setValue:self.fontColor forKey:kHDGLTitleStyleFontColor];

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

    self.picUrl = [aDecoder decodeObjectForKey:kHDGLTitleStylePicUrl];
    self.text = [aDecoder decodeObjectForKey:kHDGLTitleStyleText];
    self.fontColor = [aDecoder decodeObjectForKey:kHDGLTitleStyleFontColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kHDGLTitleStylePicUrl];
    [aCoder encodeObject:_text forKey:kHDGLTitleStyleText];
    [aCoder encodeObject:_fontColor forKey:kHDGLTitleStyleFontColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    HDGLTitleStyle *copy = [[HDGLTitleStyle alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.fontColor = [self.fontColor copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_picUrl release];
    [_text release];
    [_fontColor release];
    [super dealloc];
}

@end
