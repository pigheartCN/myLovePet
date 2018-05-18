//
//  PetTabBar.h
//  MyLovePet
//
//  Created by zhuxin on 2018/5/18.
//  Copyright © 2018年 zhuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PetTabBar : UITabBar
@property(nonatomic, copy) void (^clickBlock)(NSUInteger index);
- (void)changeViewWithIndex:(NSUInteger)index;
@end
