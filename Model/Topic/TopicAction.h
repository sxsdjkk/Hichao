//
//  TopicAction.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopicAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *noSaveButton;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *collectionCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
