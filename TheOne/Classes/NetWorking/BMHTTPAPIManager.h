//
//  BMHTTPAPIManager.h
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BMHTTPAPIManagerDelegate <NSObject>

@optional

- (void)successedWithResponseObject:(id)responseObject;
- (void)failedWithError:(NSError *)error;

@end

@interface BMHTTPAPIManager : NSObject

@property (weak, nonatomic) id<BMHTTPAPIManagerDelegate> delegate;
@property (copy, nonatomic) NSString *APIName;

- (void)loadDataWithParams:(NSDictionary *)params;

@end
