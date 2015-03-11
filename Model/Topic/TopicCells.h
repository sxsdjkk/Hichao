//
//  TopicCells.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopicComponent;

@interface TopicCells : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *y;
@property (nonatomic, strong) TopicComponent *component;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *x;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
