//
//  WaterFlowAction.h
//
//  Created by zhiyou3g  on 15/3/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WaterFlowAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *normalPicUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
