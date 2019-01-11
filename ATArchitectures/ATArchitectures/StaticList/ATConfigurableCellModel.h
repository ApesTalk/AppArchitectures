//
//  ATConfigurableCellModel.h
//  ATBetterMVC
//
//  Created by ApesTalk on 2018/12/29.
//  Copyright © 2018年 https://github.com/ApesTalk All rights reserved.
//  cell灵活可配置化，同样的sectionheader或sectionfooter也可以用类似的方式

#import <Foundation/Foundation.h>

@interface ATConfigurableCellModel : NSObject
@property (nonatomic, copy) NSString *identifier;///< cell的标志
@property (nonatomic, copy) void(^configuration)(id cell);///< 配置内容
@property (nonatomic, copy) void(^selectAction)(void);///< 点击事件回调
+ (instancetype)modelWithIdentifier:(NSString *)identifier configuration:(void(^)(id cell))configuration selectAction:(void(^)(void))selectionAction;
@end
