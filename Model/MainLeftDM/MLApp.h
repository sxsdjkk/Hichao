//
//  MLApp.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MLApp : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *versionName;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *uri;
@property (nonatomic, retain) NSString *version;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
