//
//  WaterFlowAction.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WaterFlowAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *actionType;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *actionIdentifier;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *trackValue;
@property (nonatomic, retain) NSString *normalPicUrl;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
