//
//  BannerItems.h
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BannerComponent;

@interface BannerItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) BannerComponent *component;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
