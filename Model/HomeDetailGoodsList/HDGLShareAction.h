//
//  HDGLShareAction.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDGLShare;

@interface HDGLShareAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) HDGLShare *share;
@property (nonatomic, retain) NSString *actionType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
