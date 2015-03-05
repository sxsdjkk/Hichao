//
//  BannerBaseClass.h
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BannerData;

@interface BannerBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) BannerData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
