//
//  SparkAPIClient.m
//  Spark-iOS
//
//  Created by Joseph Pintozzi on 8/12/13.
//
//

#import "SparkAPIClient.h"

@interface SparkAPIClient (){
    NSString *defaultDeviceId;
}

@end

// Base URL
NSString * const kSparkAPIBaseURLString = @"http://api.sprk.io/v1/";

@implementation SparkAPIClient

+ (SparkAPIClient *)sharedClient
{
    static SparkAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kSparkAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    // Set the default request class
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Set the default Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setDefaultDeviceId:(NSString*)deviceId{
    defaultDeviceId = deviceId;
}

- (void)setPin:(int)pinNumber onDevice:(NSString*)deviceId withLevel:(NSString*)level{
    NSAssert(deviceId != nil, @"Must pass in device ID");
    [self postPath:[@"devices/" stringByAppendingString:deviceId] parameters:@{@"pin": [NSNumber numberWithInt:pinNumber], @"level": level} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)setPinHigh:(int)pinNumber{
    [self setPin:pinNumber onDevice:defaultDeviceId withLevel:@"HIGH"];
}

- (void)setPinLow:(int)pinNumber{
    [self setPin:pinNumber onDevice:defaultDeviceId withLevel:@"LOW"];
}

@end
