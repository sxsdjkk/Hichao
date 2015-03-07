//
//  WaterFlowData.h
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WaterFlowData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *lts;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *pin;
@property (nonatomic, strong) NSString *appApi;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
