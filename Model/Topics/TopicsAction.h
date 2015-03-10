//
//  TopicsAction.h
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopicsAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *collectionCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
