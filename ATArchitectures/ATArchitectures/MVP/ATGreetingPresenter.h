//
//  ATGreetingPresenter.h
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//  the presenter layer

#import <Foundation/Foundation.h>
#import "ATPerson.h"

@protocol GreetingProtocol <NSObject>
- (void)setGreeting:(NSString *)greeting;
@end


@interface ATGreetingPresenter : NSObject
@property (nonatomic, strong) ATPerson *person;
@property (nonatomic, weak) id <GreetingProtocol> view;
- (instancetype)initWithPerson:(ATPerson *)person view:(id<GreetingProtocol>)view;///< 绑定model和view
- (void)showGreeting;///< 业务方法
@end
