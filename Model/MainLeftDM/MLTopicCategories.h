//
//  MLTopicCategories.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MLTopicCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *picUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
