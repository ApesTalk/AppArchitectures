//
//  GreetingInteractor.h
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//  Provider层

#import <Foundation/Foundation.h>
@protocol GreetingOutput;

@interface GreetingProvider : NSObject
@property (nonatomic, weak) id<GreetingOutput> output;
- (void)provideGreetingData;
@end
