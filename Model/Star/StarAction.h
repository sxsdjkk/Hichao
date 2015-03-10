//
//  StarAction.h
//
//  Created by   on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface StarAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *peopleCount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *query;
@property (nonatomic, strong) NSString *actionDescription;
@property (nonatomic, strong) NSString *tuanState;
@property (nonatomic, strong) NSString *expires;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
