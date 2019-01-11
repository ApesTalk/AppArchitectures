//
//  ATConfigurableCellModel.m
//  ATBetterMVC
//
//  Created by ApesTalk on 2018/12/29.
//  Copyright © 2018年 https://github.com/ApesTalk All rights reserved.
//

#import "ATConfigurableCellModel.h"

@implementation ATConfigurableCellModel
+ (instancetype)modelWithIdentifier:(NSString *)identifier configuration:(void(^)(id cell))configuration selectAction:(void(^)(void))selectionAction{
    ATConfigurableCellModel *model = [[ATConfigurableCellModel alloc]init];
    model.identifier = identifier;
    model.configuration = configuration;
    model.selectAction = selectionAction;
    return model;
}
@end
