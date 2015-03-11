//
//  HVCDData.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HVCDData : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *dataIdentifier;
@property (nonatomic, retain) NSString *userAvatar;
@property (nonatomic, retain) NSString *trackValue;
@property (nonatomic, retain) NSString *videoUrl;
@property (nonatomic, retain) NSArray *itemPicUrlList;
@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *dataDescription;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *collectionCount;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *commentCount;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSString *dateTime;
@property (nonatomic, retain) NSString *appApi;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
