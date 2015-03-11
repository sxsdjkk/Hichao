//
//  HDGLBaseClass.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDGLData;

@interface HDGLBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) HDGLData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
