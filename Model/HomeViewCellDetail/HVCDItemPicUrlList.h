//
//  HVCDItemPicUrlList.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HVCDItemPicUrlList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *part;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
