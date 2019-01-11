//
//  ATMVVMViewController.m
//  ATArchitectures
//
//  Created by ApesTalk on 2019/1/2.
//  Copyright © 2019年 https://github.com/ApesTalk All rights reserved.
//

#import "ATMVVMViewController.h"
#import "ATViewModel.h"

@interface ATMVVMViewController ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) ATViewModel *viewModel;
@end

@implementation ATMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MVVM";
    
    //bind ViewModel
    ATPerson *person = [[ATPerson alloc]init];
    person.name = @"ApesTalk";
    person.homepage = @"https://github.com/ApesTalk";
    _viewModel = [[ATViewModel alloc]initWithPerson:person];
    __weak typeof(self) weakSelf = self;
    _viewModel.greetingDidChange = ^(ATViewModel *model) {
        weakSelf.label.text = model.greeting;
    };
    
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn setTitle:@"Test MVVM" forState:UIControlStateNormal];
    [_btn addTarget:_viewModel action:@selector(showGreeting) forControlEvents:UIControlEventTouchUpInside];//
    [self.view addSubview:_btn];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width-40, 300)];
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
}

@end
