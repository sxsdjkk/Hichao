//
//  SLIDMQuerys.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SLIDMQuerys : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *cateimg;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSString *title;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
