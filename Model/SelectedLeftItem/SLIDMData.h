//
//  SLIDMData.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SLIDMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSArray *words;
@property (nonatomic, retain) NSArray *querys;
@property (nonatomic, retain) NSString *appApi;
@property (nonatomic, retain) NSString *version;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
