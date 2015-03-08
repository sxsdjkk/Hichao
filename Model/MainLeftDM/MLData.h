//
//  MLData.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLApp, MLConfig, MLSplash;

@interface MLData : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) MLApp *app;
@property (nonatomic, retain) MLConfig *config;
@property (nonatomic, retain) NSString *appApi;
@property (nonatomic, retain) MLSplash *splash;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
