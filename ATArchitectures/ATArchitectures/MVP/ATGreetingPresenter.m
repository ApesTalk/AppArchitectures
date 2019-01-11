//
//  ATGreetingPresenter.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "ATGreetingPresenter.h"

@implementation ATGreetingPresenter
- (instancetype)initWithPerson:(ATPerson *)person view:(id<GreetingProtocol>)view{
    if(self = [super init]){
        self.person = person;
        self.view = view;
    }
    return self;
}

- (void)showGreeting{
    [self.view setGreeting:[NSString stringWithFormat:@"%@'s homepage is %@. Thanks for your star and follow.", self.person.name, self.person.homepage]];
}
@end
