//
//  SkuTitleStyle.m
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SkuTitleStyle.h"


NSString *const kSkuTitleStylePicUrl = @"picUrl";
NSString *const kSkuTitleStyleText = @"text";
NSString *const kSkuTitleStyleFontColor = @"fontColor";


@interface SkuTitleStyle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SkuTitleStyle

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
            self.picUrl = [self objectOrNilForKey:kSkuTitleStylePicUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kSkuTitleStyleText fromDictionary:dict];
            self.fontColor = [self objectOrNilForKey:kSkuTitleStyleFontColor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picUrl forKey:kSkuTitleStylePicUrl];
    [mutableDict setValue:self.text forKey:kSkuTitleStyleText];
    [mutableDict setValue:self.fontColor forKey:kSkuTitleStyleFontColor];

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

    self.picUrl = [aDecoder decodeObjectForKey:kSkuTitleStylePicUrl];
    self.text = [aDecoder decodeObjectForKey:kSkuTitleStyleText];
    self.fontColor = [aDecoder decodeObjectForKey:kSkuTitleStyleFontColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picUrl forKey:kSkuTitleStylePicUrl];
    [aCoder encodeObject:_text forKey:kSkuTitleStyleText];
    [aCoder encodeObject:_fontColor forKey:kSkuTitleStyleFontColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    SkuTitleStyle *copy = [[SkuTitleStyle alloc] init];
    
    if (copy) {

        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.fontColor = [self.fontColor copyWithZone:zone];
    }
    
    return copy;
}


@end
