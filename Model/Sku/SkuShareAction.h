//
//  SkuShareAction.h
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkuShare;

@interface SkuShareAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SkuShare *share;
@property (nonatomic, strong) NSString *actionType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
