//
//  HDGLItemList.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDGLComponent;

@interface HDGLItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) HDGLComponent *component;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
