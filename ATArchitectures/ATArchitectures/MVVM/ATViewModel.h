//
//  ATViewModel.h
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATPerson.h"

@interface ATViewModel : NSObject
@property (nonatomic, strong) ATPerson *person;
@property (nonatomic, copy) NSString *greeting;
@property (nonatomic, copy) void (^greetingDidChange)(ATViewModel *model);

- (instancetype)initWithPerson:(ATPerson *)person;
- (void)showGreeting;

@end
