//
//  WaterFlowActions.h
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WaterFlowActions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unixtime;
@property (nonatomic, strong) NSString *actionsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *actionType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
