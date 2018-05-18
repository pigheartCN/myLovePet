//
//  PetTabBarViewController.m
//  MyLovePet
//
//  Created by zhuxin on 2018/5/18.
//  Copyright © 2018年 zhuxin. All rights reserved.
//

#import "PetTabBarViewController.h"
#import "PetTabBar.h"

@interface PetTabBarViewController ()

@property (nonatomic,strong) PetTabBar *petTabBar;

@end

@implementation PetTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _petTabBar = [[PetTabBar alloc] init];
    __weak PetTabBarViewController *weakSelf = self;
    _petTabBar.clickBlock = ^(NSUInteger index){
        [weakSelf setSelectedIndex:index];
    };
    [self setValue:_petTabBar forKey:@"tabBar"];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    [_petTabBar changeViewWithIndex:selectedIndex];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
