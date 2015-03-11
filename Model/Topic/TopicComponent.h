//
//  TopicComponent.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopicAction;

@interface TopicComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) TopicAction *action;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *border;
@property (nonatomic, strong) NSString *fontSize;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *align;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
