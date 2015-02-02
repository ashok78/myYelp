//
//  myYelpClient.h
//  myYelp
//
//  Created by Ashok Kumar on 1/29/15.
//  Copyright (c) 2015 ashok. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BDBOAuth1RequestOperationManager.h"

@interface myYelpClient : BDBOAuth1RequestOperationManager

- (id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret;

- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term params:(NSDictionary *) params success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
