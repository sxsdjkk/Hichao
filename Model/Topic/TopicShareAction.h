//
//  TopicShareAction.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopicShare;

@interface TopicShareAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) TopicShare *share;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
