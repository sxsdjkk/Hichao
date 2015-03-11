//
//  HDGLShare.h
//
//  Created by   on 15/3/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDGLShare : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *typeId;
@property (nonatomic, retain) NSString *shareType;
@property (nonatomic, retain) NSString *picUrl;
@property (nonatomic, retain) NSString *detailUrl;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *trackValue;
@property (nonatomic, retain) NSString *shareDescription;
@property (nonatomic, retain) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
