//
//  ATMVPViewController.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "ATMVPViewController.h"
#import "ATPerson.h"
#import "ATGreetingPresenter.h"

@interface ATMVPViewController ()<GreetingProtocol>
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) ATGreetingPresenter *presenter;
@end

@implementation ATMVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MVP";
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn setTitle:@"Test MVP" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(tstMVP) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width-40, 300)];
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
    
    //装配MVP, Assembling of MVP
    ATPerson *person = [[ATPerson alloc]init];
    person.name = @"ApesTalk";
    person.homepage = @"https://github.com/ApesTalk";
    _presenter = [[ATGreetingPresenter alloc]initWithPerson:person view:self];
}

- (void)tstMVP{
    [self.presenter showGreeting];
}

#pragma mark---GreetingProtocol
- (void)setGreeting:(NSString *)greeting{
    self.label.text = greeting;
}

@end
