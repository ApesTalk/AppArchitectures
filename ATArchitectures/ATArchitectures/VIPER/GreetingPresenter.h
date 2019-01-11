//
//  GreetingPresenter.h
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//  Presenter层

#import <Foundation/Foundation.h>
@class GretingData;
@protocol greetingView;
@class GreetingProvider;

@protocol GreetingOutput <NSObject>
- (void)receiveGreetingData:(GretingData *)greetingData;
@end

@protocol GreetingViewEventHandler <NSObject>
- (void)didTapShowGreetingButton;
@end

@interface GreetingPresenter : NSObject <GreetingOutput, GreetingViewEventHandler>
@property (nonatomic, weak) id <greetingView> view;
@property (nonatomic, strong) GreetingProvider *greetingProvider;
@end
