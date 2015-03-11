//
//  HVCDItemList.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HVCDComponent;

@interface HVCDItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) HVCDComponent *component;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
