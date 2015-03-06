//
//  WaterFlowData.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WaterFlowData : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSString *flag;
@property (nonatomic, retain) NSString *appApi;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
