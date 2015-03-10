//
//  MLHWBaseClass.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLHWData;

@interface MLHWBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) MLHWData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
