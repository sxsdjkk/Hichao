//
//  MLSubjectCategories.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MLSubjectCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *commentCount;
@property (nonatomic, retain) NSString *subjectCategoriesIdentifier;
@property (nonatomic, retain) NSString *online;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *threadCount;
@property (nonatomic, retain) NSString *picUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
