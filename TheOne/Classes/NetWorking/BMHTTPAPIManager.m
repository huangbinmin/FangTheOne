//
//  BMHTTPAPIManager.m
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import "BMHTTPAPIManager.h"
#import "AFNetworking.h"

@implementation BMHTTPAPIManager

- (void)loadDataWithParams:(NSDictionary *)params
{
    NSString *urlString = @"http://v3.wufazhuce.com:8000/api";
    if (self.APIName != nil)
    {
        urlString = [urlString stringByAppendingPathComponent:self.APIName];
    }
    BMLog(@"%@", urlString);
    
    __weak typeof(self)weakSelf = self;
    [[AFHTTPSessionManager manager] GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([weakSelf.delegate respondsToSelector:@selector(successedWithResponseObject:)])
        {
            [weakSelf.delegate successedWithResponseObject:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if ([weakSelf.delegate respondsToSelector:@selector(failedWithError:)])
        {
            [weakSelf.delegate failedWithError:error];
        }
        
    }];
}


@end
