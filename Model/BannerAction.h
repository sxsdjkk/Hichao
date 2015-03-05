//
//  BannerAction.h
//
//  Created by zhiyou3g  on 15/3/5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BannerAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unixtime;
@property (nonatomic, retain) NSString *actionIdentifier;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *actionType;
@property (nonatomic, retain) NSString *bannerId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
