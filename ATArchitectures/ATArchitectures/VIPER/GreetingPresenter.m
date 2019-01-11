//
//  GreetingPresenter.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "GreetingPresenter.h"
#import "GretingData.h"
#import "GreetingProvider.h"
#import "ATVIPERViewController.h"

@interface GreetingPresenter ()
@end

@implementation GreetingPresenter
- (void)didTapShowGreetingButton{
    [self.greetingProvider provideGreetingData];
}

- (void)receiveGreetingData:(GretingData *)greetingData{
    [self.view setGreeting:[NSString stringWithFormat:@"%@%@", greetingData.greeting, greetingData.subject]];
}
@end
