//
//  iTunesLookupResults.m
//
//  Created by zhiyou3g  on 15/3/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "iTunesLookupResults.h"


NSString *const kiTunesLookupResultsPrimaryGenreName = @"primaryGenreName";
NSString *const kiTunesLookupResultsArtworkUrl100 = @"artworkUrl100";
NSString *const kiTunesLookupResultsCurrency = @"currency";
NSString *const kiTunesLookupResultsArtworkUrl512 = @"artworkUrl512";
NSString *const kiTunesLookupResultsIpadScreenshotUrls = @"ipadScreenshotUrls";
NSString *const kiTunesLookupResultsFileSizeBytes = @"fileSizeBytes";
NSString *const kiTunesLookupResultsGenres = @"genres";
NSString *const kiTunesLookupResultsLanguageCodesISO2A = @"languageCodesISO2A";
NSString *const kiTunesLookupResultsArtworkUrl60 = @"artworkUrl60";
NSString *const kiTunesLookupResultsSupportedDevices = @"supportedDevices";
NSString *const kiTunesLookupResultsBundleId = @"bundleId";
NSString *const kiTunesLookupResultsTrackViewUrl = @"trackViewUrl";
NSString *const kiTunesLookupResultsVersion = @"version";
NSString *const kiTunesLookupResultsDescription = @"description";
NSString *const kiTunesLookupResultsReleaseDate = @"releaseDate";
NSString *const kiTunesLookupResultsArtistViewUrl = @"artistViewUrl";
NSString *const kiTunesLookupResultsUserRatingCountForCurrentVersion = @"userRatingCountForCurrentVersion";
NSString *const kiTunesLookupResultsWrapperType = @"wrapperType";
NSString *const kiTunesLookupResultsIsGameCenterEnabled = @"isGameCenterEnabled";
NSString *const kiTunesLookupResultsAverageUserRatingForCurrentVersion = @"averageUserRatingForCurrentVersion";
NSString *const kiTunesLookupResultsGenreIds = @"genreIds";
NSString *const kiTunesLookupResultsTrackId = @"trackId";
NSString *const kiTunesLookupResultsMinimumOsVersion = @"minimumOsVersion";
NSString *const kiTunesLookupResultsFormattedPrice = @"formattedPrice";
NSString *const kiTunesLookupResultsPrimaryGenreId = @"primaryGenreId";
NSString *const kiTunesLookupResultsUserRatingCount = @"userRatingCount";
NSString *const kiTunesLookupResultsArtistId = @"artistId";
NSString *const kiTunesLookupResultsTrackContentRating = @"trackContentRating";
NSString *const kiTunesLookupResultsArtistName = @"artistName";
NSString *const kiTunesLookupResultsPrice = @"price";
NSString *const kiTunesLookupResultsTrackCensoredName = @"trackCensoredName";
NSString *const kiTunesLookupResultsTrackName = @"trackName";
NSString *const kiTunesLookupResultsKind = @"kind";
NSString *const kiTunesLookupResultsFeatures = @"features";
NSString *const kiTunesLookupResultsContentAdvisoryRating = @"contentAdvisoryRating";
NSString *const kiTunesLookupResultsScreenshotUrls = @"screenshotUrls";
NSString *const kiTunesLookupResultsReleaseNotes = @"releaseNotes";
NSString *const kiTunesLookupResultsSellerName = @"sellerName";
NSString *const kiTunesLookupResultsAverageUserRating = @"averageUserRating";
NSString *const kiTunesLookupResultsAdvisories = @"advisories";


@interface iTunesLookupResults ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation iTunesLookupResults

@synthesize primaryGenreName = _primaryGenreName;
@synthesize artworkUrl100 = _artworkUrl100;
@synthesize currency = _currency;
@synthesize artworkUrl512 = _artworkUrl512;
@synthesize ipadScreenshotUrls = _ipadScreenshotUrls;
@synthesize fileSizeBytes = _fileSizeBytes;
@synthesize genres = _genres;
@synthesize languageCodesISO2A = _languageCodesISO2A;
@synthesize artworkUrl60 = _artworkUrl60;
@synthesize supportedDevices = _supportedDevices;
@synthesize bundleId = _bundleId;
@synthesize trackViewUrl = _trackViewUrl;
@synthesize version = _version;
@synthesize resultsDescription = _resultsDescription;
@synthesize releaseDate = _releaseDate;
@synthesize artistViewUrl = _artistViewUrl;
@synthesize userRatingCountForCurrentVersion = _userRatingCountForCurrentVersion;
@synthesize wrapperType = _wrapperType;
@synthesize isGameCenterEnabled = _isGameCenterEnabled;
@synthesize averageUserRatingForCurrentVersion = _averageUserRatingForCurrentVersion;
@synthesize genreIds = _genreIds;
@synthesize trackId = _trackId;
@synthesize minimumOsVersion = _minimumOsVersion;
@synthesize formattedPrice = _formattedPrice;
@synthesize primaryGenreId = _primaryGenreId;
@synthesize userRatingCount = _userRatingCount;
@synthesize artistId = _artistId;
@synthesize trackContentRating = _trackContentRating;
@synthesize artistName = _artistName;
@synthesize price = _price;
@synthesize trackCensoredName = _trackCensoredName;
@synthesize trackName = _trackName;
@synthesize kind = _kind;
@synthesize features = _features;
@synthesize contentAdvisoryRating = _contentAdvisoryRating;
@synthesize screenshotUrls = _screenshotUrls;
@synthesize releaseNotes = _releaseNotes;
@synthesize sellerName = _sellerName;
@synthesize averageUserRating = _averageUserRating;
@synthesize advisories = _advisories;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.primaryGenreName = [self objectOrNilForKey:kiTunesLookupResultsPrimaryGenreName fromDictionary:dict];
            self.artworkUrl100 = [self objectOrNilForKey:kiTunesLookupResultsArtworkUrl100 fromDictionary:dict];
            self.currency = [self objectOrNilForKey:kiTunesLookupResultsCurrency fromDictionary:dict];
            self.artworkUrl512 = [self objectOrNilForKey:kiTunesLookupResultsArtworkUrl512 fromDictionary:dict];
            self.ipadScreenshotUrls = [self objectOrNilForKey:kiTunesLookupResultsIpadScreenshotUrls fromDictionary:dict];
            self.fileSizeBytes = [self objectOrNilForKey:kiTunesLookupResultsFileSizeBytes fromDictionary:dict];
            self.genres = [self objectOrNilForKey:kiTunesLookupResultsGenres fromDictionary:dict];
            self.languageCodesISO2A = [self objectOrNilForKey:kiTunesLookupResultsLanguageCodesISO2A fromDictionary:dict];
            self.artworkUrl60 = [self objectOrNilForKey:kiTunesLookupResultsArtworkUrl60 fromDictionary:dict];
            self.supportedDevices = [self objectOrNilForKey:kiTunesLookupResultsSupportedDevices fromDictionary:dict];
            self.bundleId = [self objectOrNilForKey:kiTunesLookupResultsBundleId fromDictionary:dict];
            self.trackViewUrl = [self objectOrNilForKey:kiTunesLookupResultsTrackViewUrl fromDictionary:dict];
            self.version = [self objectOrNilForKey:kiTunesLookupResultsVersion fromDictionary:dict];
            self.resultsDescription = [self objectOrNilForKey:kiTunesLookupResultsDescription fromDictionary:dict];
            self.releaseDate = [self objectOrNilForKey:kiTunesLookupResultsReleaseDate fromDictionary:dict];
            self.artistViewUrl = [self objectOrNilForKey:kiTunesLookupResultsArtistViewUrl fromDictionary:dict];
            self.userRatingCountForCurrentVersion = [[self objectOrNilForKey:kiTunesLookupResultsUserRatingCountForCurrentVersion fromDictionary:dict] doubleValue];
            self.wrapperType = [self objectOrNilForKey:kiTunesLookupResultsWrapperType fromDictionary:dict];
            self.isGameCenterEnabled = [[self objectOrNilForKey:kiTunesLookupResultsIsGameCenterEnabled fromDictionary:dict] boolValue];
            self.averageUserRatingForCurrentVersion = [[self objectOrNilForKey:kiTunesLookupResultsAverageUserRatingForCurrentVersion fromDictionary:dict] doubleValue];
            self.genreIds = [self objectOrNilForKey:kiTunesLookupResultsGenreIds fromDictionary:dict];
            self.trackId = [[self objectOrNilForKey:kiTunesLookupResultsTrackId fromDictionary:dict] doubleValue];
            self.minimumOsVersion = [self objectOrNilForKey:kiTunesLookupResultsMinimumOsVersion fromDictionary:dict];
            self.formattedPrice = [self objectOrNilForKey:kiTunesLookupResultsFormattedPrice fromDictionary:dict];
            self.primaryGenreId = [[self objectOrNilForKey:kiTunesLookupResultsPrimaryGenreId fromDictionary:dict] doubleValue];
            self.userRatingCount = [[self objectOrNilForKey:kiTunesLookupResultsUserRatingCount fromDictionary:dict] doubleValue];
            self.artistId = [[self objectOrNilForKey:kiTunesLookupResultsArtistId fromDictionary:dict] doubleValue];
            self.trackContentRating = [self objectOrNilForKey:kiTunesLookupResultsTrackContentRating fromDictionary:dict];
            self.artistName = [self objectOrNilForKey:kiTunesLookupResultsArtistName fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kiTunesLookupResultsPrice fromDictionary:dict] doubleValue];
            self.trackCensoredName = [self objectOrNilForKey:kiTunesLookupResultsTrackCensoredName fromDictionary:dict];
            self.trackName = [self objectOrNilForKey:kiTunesLookupResultsTrackName fromDictionary:dict];
            self.kind = [self objectOrNilForKey:kiTunesLookupResultsKind fromDictionary:dict];
            self.features = [self objectOrNilForKey:kiTunesLookupResultsFeatures fromDictionary:dict];
            self.contentAdvisoryRating = [self objectOrNilForKey:kiTunesLookupResultsContentAdvisoryRating fromDictionary:dict];
            self.screenshotUrls = [self objectOrNilForKey:kiTunesLookupResultsScreenshotUrls fromDictionary:dict];
            self.releaseNotes = [self objectOrNilForKey:kiTunesLookupResultsReleaseNotes fromDictionary:dict];
            self.sellerName = [self objectOrNilForKey:kiTunesLookupResultsSellerName fromDictionary:dict];
            self.averageUserRating = [[self objectOrNilForKey:kiTunesLookupResultsAverageUserRating fromDictionary:dict] doubleValue];
            self.advisories = [self objectOrNilForKey:kiTunesLookupResultsAdvisories fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.primaryGenreName forKey:kiTunesLookupResultsPrimaryGenreName];
    [mutableDict setValue:self.artworkUrl100 forKey:kiTunesLookupResultsArtworkUrl100];
    [mutableDict setValue:self.currency forKey:kiTunesLookupResultsCurrency];
    [mutableDict setValue:self.artworkUrl512 forKey:kiTunesLookupResultsArtworkUrl512];
    NSMutableArray *tempArrayForIpadScreenshotUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ipadScreenshotUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIpadScreenshotUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIpadScreenshotUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIpadScreenshotUrls] forKey:kiTunesLookupResultsIpadScreenshotUrls];
    [mutableDict setValue:self.fileSizeBytes forKey:kiTunesLookupResultsFileSizeBytes];
    NSMutableArray *tempArrayForGenres = [NSMutableArray array];
    for (NSObject *subArrayObject in self.genres) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGenres addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGenres addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGenres] forKey:kiTunesLookupResultsGenres];
    NSMutableArray *tempArrayForLanguageCodesISO2A = [NSMutableArray array];
    for (NSObject *subArrayObject in self.languageCodesISO2A) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLanguageCodesISO2A addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLanguageCodesISO2A addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLanguageCodesISO2A] forKey:kiTunesLookupResultsLanguageCodesISO2A];
    [mutableDict setValue:self.artworkUrl60 forKey:kiTunesLookupResultsArtworkUrl60];
    NSMutableArray *tempArrayForSupportedDevices = [NSMutableArray array];
    for (NSObject *subArrayObject in self.supportedDevices) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSupportedDevices addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSupportedDevices addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSupportedDevices] forKey:kiTunesLookupResultsSupportedDevices];
    [mutableDict setValue:self.bundleId forKey:kiTunesLookupResultsBundleId];
    [mutableDict setValue:self.trackViewUrl forKey:kiTunesLookupResultsTrackViewUrl];
    [mutableDict setValue:self.version forKey:kiTunesLookupResultsVersion];
    [mutableDict setValue:self.resultsDescription forKey:kiTunesLookupResultsDescription];
    [mutableDict setValue:self.releaseDate forKey:kiTunesLookupResultsReleaseDate];
    [mutableDict setValue:self.artistViewUrl forKey:kiTunesLookupResultsArtistViewUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userRatingCountForCurrentVersion] forKey:kiTunesLookupResultsUserRatingCountForCurrentVersion];
    [mutableDict setValue:self.wrapperType forKey:kiTunesLookupResultsWrapperType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isGameCenterEnabled] forKey:kiTunesLookupResultsIsGameCenterEnabled];
    [mutableDict setValue:[NSNumber numberWithDouble:self.averageUserRatingForCurrentVersion] forKey:kiTunesLookupResultsAverageUserRatingForCurrentVersion];
    NSMutableArray *tempArrayForGenreIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.genreIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGenreIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGenreIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGenreIds] forKey:kiTunesLookupResultsGenreIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kiTunesLookupResultsTrackId];
    [mutableDict setValue:self.minimumOsVersion forKey:kiTunesLookupResultsMinimumOsVersion];
    [mutableDict setValue:self.formattedPrice forKey:kiTunesLookupResultsFormattedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.primaryGenreId] forKey:kiTunesLookupResultsPrimaryGenreId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userRatingCount] forKey:kiTunesLookupResultsUserRatingCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.artistId] forKey:kiTunesLookupResultsArtistId];
    [mutableDict setValue:self.trackContentRating forKey:kiTunesLookupResultsTrackContentRating];
    [mutableDict setValue:self.artistName forKey:kiTunesLookupResultsArtistName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kiTunesLookupResultsPrice];
    [mutableDict setValue:self.trackCensoredName forKey:kiTunesLookupResultsTrackCensoredName];
    [mutableDict setValue:self.trackName forKey:kiTunesLookupResultsTrackName];
    [mutableDict setValue:self.kind forKey:kiTunesLookupResultsKind];
    NSMutableArray *tempArrayForFeatures = [NSMutableArray array];
    for (NSObject *subArrayObject in self.features) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFeatures addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFeatures addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatures] forKey:kiTunesLookupResultsFeatures];
    [mutableDict setValue:self.contentAdvisoryRating forKey:kiTunesLookupResultsContentAdvisoryRating];
    NSMutableArray *tempArrayForScreenshotUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.screenshotUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForScreenshotUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForScreenshotUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForScreenshotUrls] forKey:kiTunesLookupResultsScreenshotUrls];
    [mutableDict setValue:self.releaseNotes forKey:kiTunesLookupResultsReleaseNotes];
    [mutableDict setValue:self.sellerName forKey:kiTunesLookupResultsSellerName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.averageUserRating] forKey:kiTunesLookupResultsAverageUserRating];
    NSMutableArray *tempArrayForAdvisories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.advisories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAdvisories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAdvisories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAdvisories] forKey:kiTunesLookupResultsAdvisories];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.primaryGenreName = [aDecoder decodeObjectForKey:kiTunesLookupResultsPrimaryGenreName];
    self.artworkUrl100 = [aDecoder decodeObjectForKey:kiTunesLookupResultsArtworkUrl100];
    self.currency = [aDecoder decodeObjectForKey:kiTunesLookupResultsCurrency];
    self.artworkUrl512 = [aDecoder decodeObjectForKey:kiTunesLookupResultsArtworkUrl512];
    self.ipadScreenshotUrls = [aDecoder decodeObjectForKey:kiTunesLookupResultsIpadScreenshotUrls];
    self.fileSizeBytes = [aDecoder decodeObjectForKey:kiTunesLookupResultsFileSizeBytes];
    self.genres = [aDecoder decodeObjectForKey:kiTunesLookupResultsGenres];
    self.languageCodesISO2A = [aDecoder decodeObjectForKey:kiTunesLookupResultsLanguageCodesISO2A];
    self.artworkUrl60 = [aDecoder decodeObjectForKey:kiTunesLookupResultsArtworkUrl60];
    self.supportedDevices = [aDecoder decodeObjectForKey:kiTunesLookupResultsSupportedDevices];
    self.bundleId = [aDecoder decodeObjectForKey:kiTunesLookupResultsBundleId];
    self.trackViewUrl = [aDecoder decodeObjectForKey:kiTunesLookupResultsTrackViewUrl];
    self.version = [aDecoder decodeObjectForKey:kiTunesLookupResultsVersion];
    self.resultsDescription = [aDecoder decodeObjectForKey:kiTunesLookupResultsDescription];
    self.releaseDate = [aDecoder decodeObjectForKey:kiTunesLookupResultsReleaseDate];
    self.artistViewUrl = [aDecoder decodeObjectForKey:kiTunesLookupResultsArtistViewUrl];
    self.userRatingCountForCurrentVersion = [aDecoder decodeDoubleForKey:kiTunesLookupResultsUserRatingCountForCurrentVersion];
    self.wrapperType = [aDecoder decodeObjectForKey:kiTunesLookupResultsWrapperType];
    self.isGameCenterEnabled = [aDecoder decodeBoolForKey:kiTunesLookupResultsIsGameCenterEnabled];
    self.averageUserRatingForCurrentVersion = [aDecoder decodeDoubleForKey:kiTunesLookupResultsAverageUserRatingForCurrentVersion];
    self.genreIds = [aDecoder decodeObjectForKey:kiTunesLookupResultsGenreIds];
    self.trackId = [aDecoder decodeDoubleForKey:kiTunesLookupResultsTrackId];
    self.minimumOsVersion = [aDecoder decodeObjectForKey:kiTunesLookupResultsMinimumOsVersion];
    self.formattedPrice = [aDecoder decodeObjectForKey:kiTunesLookupResultsFormattedPrice];
    self.primaryGenreId = [aDecoder decodeDoubleForKey:kiTunesLookupResultsPrimaryGenreId];
    self.userRatingCount = [aDecoder decodeDoubleForKey:kiTunesLookupResultsUserRatingCount];
    self.artistId = [aDecoder decodeDoubleForKey:kiTunesLookupResultsArtistId];
    self.trackContentRating = [aDecoder decodeObjectForKey:kiTunesLookupResultsTrackContentRating];
    self.artistName = [aDecoder decodeObjectForKey:kiTunesLookupResultsArtistName];
    self.price = [aDecoder decodeDoubleForKey:kiTunesLookupResultsPrice];
    self.trackCensoredName = [aDecoder decodeObjectForKey:kiTunesLookupResultsTrackCensoredName];
    self.trackName = [aDecoder decodeObjectForKey:kiTunesLookupResultsTrackName];
    self.kind = [aDecoder decodeObjectForKey:kiTunesLookupResultsKind];
    self.features = [aDecoder decodeObjectForKey:kiTunesLookupResultsFeatures];
    self.contentAdvisoryRating = [aDecoder decodeObjectForKey:kiTunesLookupResultsContentAdvisoryRating];
    self.screenshotUrls = [aDecoder decodeObjectForKey:kiTunesLookupResultsScreenshotUrls];
    self.releaseNotes = [aDecoder decodeObjectForKey:kiTunesLookupResultsReleaseNotes];
    self.sellerName = [aDecoder decodeObjectForKey:kiTunesLookupResultsSellerName];
    self.averageUserRating = [aDecoder decodeDoubleForKey:kiTunesLookupResultsAverageUserRating];
    self.advisories = [aDecoder decodeObjectForKey:kiTunesLookupResultsAdvisories];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_primaryGenreName forKey:kiTunesLookupResultsPrimaryGenreName];
    [aCoder encodeObject:_artworkUrl100 forKey:kiTunesLookupResultsArtworkUrl100];
    [aCoder encodeObject:_currency forKey:kiTunesLookupResultsCurrency];
    [aCoder encodeObject:_artworkUrl512 forKey:kiTunesLookupResultsArtworkUrl512];
    [aCoder encodeObject:_ipadScreenshotUrls forKey:kiTunesLookupResultsIpadScreenshotUrls];
    [aCoder encodeObject:_fileSizeBytes forKey:kiTunesLookupResultsFileSizeBytes];
    [aCoder encodeObject:_genres forKey:kiTunesLookupResultsGenres];
    [aCoder encodeObject:_languageCodesISO2A forKey:kiTunesLookupResultsLanguageCodesISO2A];
    [aCoder encodeObject:_artworkUrl60 forKey:kiTunesLookupResultsArtworkUrl60];
    [aCoder encodeObject:_supportedDevices forKey:kiTunesLookupResultsSupportedDevices];
    [aCoder encodeObject:_bundleId forKey:kiTunesLookupResultsBundleId];
    [aCoder encodeObject:_trackViewUrl forKey:kiTunesLookupResultsTrackViewUrl];
    [aCoder encodeObject:_version forKey:kiTunesLookupResultsVersion];
    [aCoder encodeObject:_resultsDescription forKey:kiTunesLookupResultsDescription];
    [aCoder encodeObject:_releaseDate forKey:kiTunesLookupResultsReleaseDate];
    [aCoder encodeObject:_artistViewUrl forKey:kiTunesLookupResultsArtistViewUrl];
    [aCoder encodeDouble:_userRatingCountForCurrentVersion forKey:kiTunesLookupResultsUserRatingCountForCurrentVersion];
    [aCoder encodeObject:_wrapperType forKey:kiTunesLookupResultsWrapperType];
    [aCoder encodeBool:_isGameCenterEnabled forKey:kiTunesLookupResultsIsGameCenterEnabled];
    [aCoder encodeDouble:_averageUserRatingForCurrentVersion forKey:kiTunesLookupResultsAverageUserRatingForCurrentVersion];
    [aCoder encodeObject:_genreIds forKey:kiTunesLookupResultsGenreIds];
    [aCoder encodeDouble:_trackId forKey:kiTunesLookupResultsTrackId];
    [aCoder encodeObject:_minimumOsVersion forKey:kiTunesLookupResultsMinimumOsVersion];
    [aCoder encodeObject:_formattedPrice forKey:kiTunesLookupResultsFormattedPrice];
    [aCoder encodeDouble:_primaryGenreId forKey:kiTunesLookupResultsPrimaryGenreId];
    [aCoder encodeDouble:_userRatingCount forKey:kiTunesLookupResultsUserRatingCount];
    [aCoder encodeDouble:_artistId forKey:kiTunesLookupResultsArtistId];
    [aCoder encodeObject:_trackContentRating forKey:kiTunesLookupResultsTrackContentRating];
    [aCoder encodeObject:_artistName forKey:kiTunesLookupResultsArtistName];
    [aCoder encodeDouble:_price forKey:kiTunesLookupResultsPrice];
    [aCoder encodeObject:_trackCensoredName forKey:kiTunesLookupResultsTrackCensoredName];
    [aCoder encodeObject:_trackName forKey:kiTunesLookupResultsTrackName];
    [aCoder encodeObject:_kind forKey:kiTunesLookupResultsKind];
    [aCoder encodeObject:_features forKey:kiTunesLookupResultsFeatures];
    [aCoder encodeObject:_contentAdvisoryRating forKey:kiTunesLookupResultsContentAdvisoryRating];
    [aCoder encodeObject:_screenshotUrls forKey:kiTunesLookupResultsScreenshotUrls];
    [aCoder encodeObject:_releaseNotes forKey:kiTunesLookupResultsReleaseNotes];
    [aCoder encodeObject:_sellerName forKey:kiTunesLookupResultsSellerName];
    [aCoder encodeDouble:_averageUserRating forKey:kiTunesLookupResultsAverageUserRating];
    [aCoder encodeObject:_advisories forKey:kiTunesLookupResultsAdvisories];
}

- (id)copyWithZone:(NSZone *)zone
{
    iTunesLookupResults *copy = [[iTunesLookupResults alloc] init];
    
    if (copy) {

        copy.primaryGenreName = [self.primaryGenreName copyWithZone:zone];
        copy.artworkUrl100 = [self.artworkUrl100 copyWithZone:zone];
        copy.currency = [self.currency copyWithZone:zone];
        copy.artworkUrl512 = [self.artworkUrl512 copyWithZone:zone];
        copy.ipadScreenshotUrls = [self.ipadScreenshotUrls copyWithZone:zone];
        copy.fileSizeBytes = [self.fileSizeBytes copyWithZone:zone];
        copy.genres = [self.genres copyWithZone:zone];
        copy.languageCodesISO2A = [self.languageCodesISO2A copyWithZone:zone];
        copy.artworkUrl60 = [self.artworkUrl60 copyWithZone:zone];
        copy.supportedDevices = [self.supportedDevices copyWithZone:zone];
        copy.bundleId = [self.bundleId copyWithZone:zone];
        copy.trackViewUrl = [self.trackViewUrl copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
        copy.resultsDescription = [self.resultsDescription copyWithZone:zone];
        copy.releaseDate = [self.releaseDate copyWithZone:zone];
        copy.artistViewUrl = [self.artistViewUrl copyWithZone:zone];
        copy.userRatingCountForCurrentVersion = self.userRatingCountForCurrentVersion;
        copy.wrapperType = [self.wrapperType copyWithZone:zone];
        copy.isGameCenterEnabled = self.isGameCenterEnabled;
        copy.averageUserRatingForCurrentVersion = self.averageUserRatingForCurrentVersion;
        copy.genreIds = [self.genreIds copyWithZone:zone];
        copy.trackId = self.trackId;
        copy.minimumOsVersion = [self.minimumOsVersion copyWithZone:zone];
        copy.formattedPrice = [self.formattedPrice copyWithZone:zone];
        copy.primaryGenreId = self.primaryGenreId;
        copy.userRatingCount = self.userRatingCount;
        copy.artistId = self.artistId;
        copy.trackContentRating = [self.trackContentRating copyWithZone:zone];
        copy.artistName = [self.artistName copyWithZone:zone];
        copy.price = self.price;
        copy.trackCensoredName = [self.trackCensoredName copyWithZone:zone];
        copy.trackName = [self.trackName copyWithZone:zone];
        copy.kind = [self.kind copyWithZone:zone];
        copy.features = [self.features copyWithZone:zone];
        copy.contentAdvisoryRating = [self.contentAdvisoryRating copyWithZone:zone];
        copy.screenshotUrls = [self.screenshotUrls copyWithZone:zone];
        copy.releaseNotes = [self.releaseNotes copyWithZone:zone];
        copy.sellerName = [self.sellerName copyWithZone:zone];
        copy.averageUserRating = self.averageUserRating;
        copy.advisories = [self.advisories copyWithZone:zone];
    }
    
    return copy;
}


@end
