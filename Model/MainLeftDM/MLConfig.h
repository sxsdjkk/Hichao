//
//  MLConfig.h
//
//  Created by   on 15/3/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLCountly;

@interface MLConfig : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *subjectCategoryDefault;
@property (nonatomic, retain) NSArray *ignoreCpsPrefix;
@property (nonatomic, retain) NSString *unixtime;
@property (nonatomic, retain) NSArray *starCategoryUI;
@property (nonatomic, retain) NSString *starCategoryDefault;
@property (nonatomic, retain) NSArray *mobileTopicCategories;
@property (nonatomic, retain) NSArray *topicCategoryUI;
@property (nonatomic, retain) NSArray *topicCategories;
@property (nonatomic, retain) NSArray *subjectCategoryUI;
@property (nonatomic, retain) NSArray *mobileSubjectCategories;
@property (nonatomic, retain) NSArray *vItemStarCategories;
@property (nonatomic, retain) NSArray *showBanner;
@property (nonatomic, retain) NSString *webAdBlocker;
@property (nonatomic, retain) NSString *showSkuImgs;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) MLCountly *countly;
@property (nonatomic, retain) NSString *topicCategoryDefault;
@property (nonatomic, retain) NSArray *showTimer;
@property (nonatomic, retain) NSArray *starCategories;
@property (nonatomic, retain) NSArray *subjectCategories;
@property (nonatomic, retain) NSString *ladyDuration;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
