//
//  HDGLTitleStyle.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDGLTitleStyle : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *fontColor;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
