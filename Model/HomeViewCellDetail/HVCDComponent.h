//
//  HVCDComponent.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HVCDAction;

@interface HVCDComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) HVCDAction *action;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *componentType;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *sourceTitle;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *componentIdentifier;
@property (nonatomic, retain) NSString *collectionCount;
@property (nonatomic, retain) NSString *sourcePicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
