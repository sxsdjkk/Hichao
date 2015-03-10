//
//  StarComponent.h
//
//  Created by   on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StarAction;

@interface StarComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) StarAction *action;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *componentIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *peopleCount;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *slide;
@property (nonatomic, strong) NSString *expires;
@property (nonatomic, strong) NSString *tuanState;
//@property (nonatomic, strong) NSString *pID;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
