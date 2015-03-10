//
//  iTunesLookupResults.h
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface iTunesLookupResults : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *primaryGenreName;
@property (nonatomic, strong) NSString *artworkUrl100;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *artworkUrl512;
@property (nonatomic, strong) NSArray *ipadScreenshotUrls;
@property (nonatomic, strong) NSString *fileSizeBytes;
@property (nonatomic, strong) NSArray *genres;
@property (nonatomic, strong) NSArray *languageCodesISO2A;
@property (nonatomic, strong) NSString *artworkUrl60;
@property (nonatomic, strong) NSArray *supportedDevices;
@property (nonatomic, strong) NSString *bundleId;
@property (nonatomic, strong) NSString *trackViewUrl;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *resultsDescription;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *artistViewUrl;
@property (nonatomic, assign) double userRatingCountForCurrentVersion;
@property (nonatomic, strong) NSString *wrapperType;
@property (nonatomic, assign) BOOL isGameCenterEnabled;
@property (nonatomic, assign) double averageUserRatingForCurrentVersion;
@property (nonatomic, strong) NSArray *genreIds;
@property (nonatomic, assign) double trackId;
@property (nonatomic, strong) NSString *minimumOsVersion;
@property (nonatomic, strong) NSString *formattedPrice;
@property (nonatomic, assign) double primaryGenreId;
@property (nonatomic, assign) double userRatingCount;
@property (nonatomic, assign) double artistId;
@property (nonatomic, strong) NSString *trackContentRating;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *trackCensoredName;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSArray *features;
@property (nonatomic, strong) NSString *contentAdvisoryRating;
@property (nonatomic, strong) NSArray *screenshotUrls;
@property (nonatomic, strong) NSString *releaseNotes;
@property (nonatomic, strong) NSString *sellerName;
@property (nonatomic, assign) double averageUserRating;
@property (nonatomic, strong) NSArray *advisories;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
