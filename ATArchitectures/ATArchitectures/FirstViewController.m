//
//  FirstViewController.m
//  ATBetterMVC
//
//  Created by ApesTalk on 2018/12/29.
//  Copyright © 2018年 https://github.com/ApesTalk All rights reserved.
//

#import "FirstViewController.h"
#import "ATConfigurableCellModel.h"

static NSString *cellIdentifier = @"cell";

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *modelList;
@property (nonatomic, strong) UITableView *table;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"静态数据列表";
    _modelList = [NSMutableArray array];
    [self.view addSubview:self.table];
    [self generateData];
}

- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
        _table.dataSource = self;
        _table.delegate = self;
    }
    return _table;
}

- (void)generateData{
    //设置数据源，下次要改变列表展示条数，只需要修改这里即可。
    NSArray *titles = @[@"MVP",@"MVVM",@"VIPER",@"ROUTER"];
    NSArray *classNames = @[@"ATMVPViewController",@"ATMVVMViewController",@"ATVIPERViewController",@"ATROUTERViewController"];
    NSMutableArray *sectionData = [NSMutableArray arrayWithCapacity:titles.count];
    __weak typeof(self) weakSelf = self;
    for(NSInteger row = 0; row < titles.count; row++){
        //在这里按需配置你的各种样式的cell的展示和点击事件，这里只是简单举个例子。
        //把id cell按需换成你实际的cell名，这样就不会报警告了，这里只是简单举例，所以换成UITableViewCell *cell
        ATConfigurableCellModel *cellModel = [ATConfigurableCellModel modelWithIdentifier:cellIdentifier configuration:^(UITableViewCell *cell) {
            //这里注意weakSelf，不要造成循环引用
            cell.textLabel.text = titles[row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } selectAction:^{
            //这里注意weakSelf，不要造成循环引用
            //按需做点击后跳转等操作
            UIViewController *vc = [[NSClassFromString(classNames[row]) alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
        [sectionData addObject:cellModel];
    }
    [_modelList addObject:sectionData];
}

#pragma mark---UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionData = [self.modelList objectAtIndex:section];
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里就不需要if else 或switch来判断类型了
    NSArray *sectionData = [self.modelList objectAtIndex:indexPath.section];
    ATConfigurableCellModel *cellModel = [sectionData objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.identifier];
    if(cellModel.configuration){
        cellModel.configuration(cell);
    }
    return cell;
}

#pragma mark---UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //这里就不需要if else 或switch来判断类型了
    NSArray *sectionData = [self.modelList objectAtIndex:indexPath.section];
    ATConfigurableCellModel *cellModel = [sectionData objectAtIndex:indexPath.row];
    if(cellModel.selectAction){
        cellModel.selectAction();
    }
}

@end
