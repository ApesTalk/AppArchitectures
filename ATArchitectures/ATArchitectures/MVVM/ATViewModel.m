//
//  ATViewModel.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "ATViewModel.h"

@implementation ATViewModel
- (instancetype)initWithPerson:(ATPerson *)person{
    if(self = [super init]){
        self.person = person;
    }
    return self;
}

- (void)setGreeting:(NSString *)greeting{
    _greeting = [greeting copy]; 
    !self.greetingDidChange?:self.greetingDidChange(self);
}

- (void)showGreeting{
    self.greeting = [NSString stringWithFormat:@"%@'s homepage is %@. Thanks for your star and follow.", self.person.name, self.person.homepage];
}
@end
