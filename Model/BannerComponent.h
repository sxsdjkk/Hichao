//
//  BannerComponent.h
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BannerAction;

@interface BannerComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) BannerAction *action;
@property (nonatomic, retain) NSString *componentType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
