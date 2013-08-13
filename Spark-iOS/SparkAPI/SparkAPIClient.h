//
//  SparkAPIClient.h
//  Spark-iOS
//
//  Created by Joseph Pintozzi on 8/12/13.
//
//

#import "AFNetworking.h"

typedef void (^SparkAPICompletionBlock)(id result, NSError *error);

@interface SparkAPIClient : AFHTTPClient

+ (SparkAPIClient*)sharedClient;

// Super simple API calls, meant for beginners

- (void)setDefaultDeviceId:(NSString*)deviceId;

- (void)setPinHigh:(int)pinNumber;

- (void)setPinLow:(int)pinNumber;

// More advanced API calls, not meant for beginners

- (void)getDevicesWithCompletionBlock:(SparkAPICompletionBlock)completionBlock;

- (void)getDevice:(NSString*)deviceId withCompletionBlock:(SparkAPICompletionBlock)completionBlock;

// groups!

- (void)getGroupsWithCompletionBlock:(SparkAPICompletionBlock)completionBlock;

- (void)getGroup:(NSString*)groupId withCompletionBlock:(SparkAPICompletionBlock)completionBlock;

- (void)createNewGroup:(NSArray*)deviceIds withCompletionBlock:(SparkAPICompletionBlock)completionBlock;

- (void)deleteGroup:(NSString*)groupId withCompletionBlock:(SparkAPICompletionBlock)completionBlock;

@end
