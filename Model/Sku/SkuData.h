//
//  SkuData.h
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkuShareAction, SkuTitleStyle;

@interface SkuData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) SkuShareAction *shareAction;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *appApi;
@property (nonatomic, strong) NSString *normalPicUrl;
@property (nonatomic, strong) NSString *originLink;
@property (nonatomic, strong) SkuTitleStyle *titleStyle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
