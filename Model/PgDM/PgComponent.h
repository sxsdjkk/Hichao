//
//  PgComponent.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PgComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *componentIdentifier;
@property (nonatomic, retain) NSString *userAvatar;
@property (nonatomic, retain) NSString *publishDate;
@property (nonatomic, retain) NSArray *actions;
@property (nonatomic, retain) NSArray *pics;
@property (nonatomic, retain) NSString *forum;
@property (nonatomic, retain) NSString *componentType;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *commentCount;
@property (nonatomic, retain) NSString *showIcon;
@property (nonatomic, retain) NSString *v;
@property (nonatomic, retain) NSString *forumId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
