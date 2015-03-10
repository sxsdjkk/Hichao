//
//  HStarComponent.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HStarAction;

@interface HStarComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *componentIdentifier;
@property (nonatomic, retain) NSString *discount;
@property (nonatomic, retain) NSString *componentDescription;
@property (nonatomic, retain) NSString *tuanId;
@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *expires;
@property (nonatomic, retain) NSString *componentType;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *peopleCount;
@property (nonatomic, retain) NSString *tag;
@property (nonatomic, retain) HStarAction *action;
@property (nonatomic, retain) NSString *tuanState;
@property (nonatomic, retain) NSString *priceOrig;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
