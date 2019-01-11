//
//  GreetingInteractor.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/6.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "GreetingProvider.h"
#import "ATGitUser.h"
#import "GretingData.h"
#import "GreetingPresenter.h"

@implementation GreetingProvider
- (void)provideGreetingData{
    ATGitUser *user = [[ATGitUser alloc]init];
    user.name = @"ApesTalk";
    user.email = @"apestalk@gmail.com";
    user.homepage = @"https://github.com/ApesTalk";
    
    GretingData *greetingData = [[GretingData alloc]init];
    greetingData.greeting =  [NSString stringWithFormat:@"%@'s email is %@ and homepage is %@. ", user.name, user.email, user.homepage];
    greetingData.subject = @"Thanks for your star and follow.";
    
    [self.output receiveGreetingData:greetingData];
}
@end
