//
//  ATVIPERViewController.h
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol greetingView <NSObject>
- (void)setGreeting:(NSString *)greeting;
@end


@interface ATVIPERViewController : UIViewController<greetingView>

@end
