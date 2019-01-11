//
//  ATVIPERViewController.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "ATVIPERViewController.h"
#import "GreetingPresenter.h"
#import "GreetingProvider.h"

@interface ATVIPERViewController ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) id <GreetingViewEventHandler> eventHandler;
@end

@implementation ATVIPERViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"VIPER";
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn setTitle:@"Test VIPER" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];//
    [self.view addSubview:_btn];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width-40, 300)];
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
    
    
    GreetingPresenter *presenter = [[GreetingPresenter alloc]init];
    GreetingProvider *interactor = [[GreetingProvider alloc]init];
    self.eventHandler = presenter;
    presenter.view = self;
    presenter.greetingProvider = interactor;
    interactor.output = presenter;
    
}

- (void)didTapButton{
    [self.eventHandler didTapShowGreetingButton];
}



- (void)setGreeting:(NSString *)greeting{
    self.label.text = greeting;
}

@end
