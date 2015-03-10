//
//  SLIDMWords.h
//
//  Created by   on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SLIDMWords : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *fw;
@property (nonatomic, retain) NSString *aw;
@property (nonatomic, retain) NSString *n;
@property (nonatomic, retain) NSString *pic;
@property (nonatomic, retain) NSString *c;
@property (nonatomic, retain) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
