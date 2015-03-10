//
//  SLIDMComponent.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLIDMAction;

@interface SLIDMComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *word;
@property (nonatomic, retain) NSString *componentType;
@property (nonatomic, retain) SLIDMAction *action;
@property (nonatomic, retain) NSString *picUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
