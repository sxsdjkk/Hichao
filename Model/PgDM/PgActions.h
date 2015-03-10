//
//  PgActions.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PgActions : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *actionsIdentifier;
@property (nonatomic, retain) NSString *userAvatar;
@property (nonatomic, retain) NSString *actionType;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *userName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
