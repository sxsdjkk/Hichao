//
//  PgItems.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PgComponent;

@interface PgItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *uts;
@property (nonatomic, retain) PgComponent *component;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
