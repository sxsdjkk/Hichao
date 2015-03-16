//
//  SkuShare.h
//
//  Created by zhiyou3g  on 3/16/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SkuShare : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *shareType;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *detailUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *trackValue;
@property (nonatomic, strong) NSString *shareDescription;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
