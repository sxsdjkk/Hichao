//
//  TopicShare.h
//
//  Created by zhiyou3g  on 15/3/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopicShare : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *shareType;
@property (nonatomic, strong) NSString *shareIdentifier;
@property (nonatomic, strong) NSString *detailUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *shareDescription;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
