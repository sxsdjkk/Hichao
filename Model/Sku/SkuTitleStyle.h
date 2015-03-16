//
//  SkuTitleStyle.h
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SkuTitleStyle : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *fontColor;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
