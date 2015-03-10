//
//  HStarAction.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HStarAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *actionType;
@property (nonatomic, retain) NSString *trackValue;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
