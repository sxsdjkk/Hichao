//
//  MLCountly.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MLCountly : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *appkey;
@property (nonatomic, retain) NSString *available;
@property (nonatomic, retain) NSString *host;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
