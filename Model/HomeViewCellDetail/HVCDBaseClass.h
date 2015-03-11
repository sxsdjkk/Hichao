//
//  HVCDBaseClass.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HVCDData;

@interface HVCDBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) HVCDData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
