//
//  HDGLAction.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HDGLShareAction, HDGLTitleStyle;

@interface HDGLAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *actionIdentifier;
@property (nonatomic, retain) NSString *actionDescription;
@property (nonatomic, retain) NSString *channel;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *source;
@property (nonatomic, retain) HDGLShareAction *shareAction;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *collectionCount;
@property (nonatomic, retain) NSString *actionType;
@property (nonatomic, retain) NSString *sourceId;
@property (nonatomic, retain) NSString *normalPicUrl;
@property (nonatomic, retain) NSString *originLink;
@property (nonatomic, retain) HDGLTitleStyle *titleStyle;
@property (nonatomic, retain) NSString *channelPicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
