//
//  PetTabBar.m
//  MyLovePet
//
//  Created by zhuxin on 2018/5/18.
//  Copyright © 2018年 zhuxin. All rights reserved.
//

#import "PetTabBar.h"
#import "PetTabBarBtn.h"

@interface PetTabBar ()
@property (nonatomic,strong) PetTabBarBtn *previousBtn;
@property (nonatomic,strong) UIImageView *tabBarView;
@property (nonatomic,assign) NSUInteger selectedIndex;
@property (nonatomic,assign) NSInteger tabCount;
@end

@implementation PetTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (UIControl *tabBarButton in self.subviews) {
        // 如果不是tabBarView类型，就直接过掉
        if ([@"UITabBarButton" isEqualToString:NSStringFromClass(_tabBarView.class)]) continue;
        tabBarButton.hidden = YES;
    }
    [self setupTabBar];
}

- (void)setupTabBar {
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    lineView.backgroundColor = hexColor(@"#e5e5e5");
    [self addSubview:lineView];
    
    _tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0.5, self.frameWidth, 48.5)];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_tabBarView];
    
    NSArray *arr = @[@[@"home_noun_normal", @"home_noun_selected", @"首页"],
                     @[@"home_mall_normal", @"home_mall_selected", @"商城"],
                     @[@"home_add", @"home_add", @""],
                     @[@"home_message_normal", @"home_message_selected", @"消息"],
                     @[@"home_shit_officer_normal", @"home_shit_officer_selected", @"铲屎官"]];
    NSMutableArray *img_title_arr = [NSMutableArray arrayWithArray:arr];
    
    _tabCount = img_title_arr.count;
    for (int i=0; i<img_title_arr.count; i++) {
        [self addBtnWithNormalImg:img_title_arr[i][0] selectdImg:img_title_arr[i][1] title:img_title_arr[i][2] index:i];
    }
    _previousBtn = _tabBarView.subviews[self.selectedIndex];
    [self changeViewController:_previousBtn];
}
- (void)addBtnWithNormalImg:(NSString *)normal selectdImg:(NSString *)selected title:(NSString *)title index:(int)index{
    PetTabBarBtn *btn = [PetTabBarBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = index;
    CGFloat buttonW = _tabBarView.frame.size.width/ _tabCount;
    CGFloat buttonH = _tabBarView.frame.size.height;
    btn.frame = CGRectMake(buttonW *index, 0, buttonW, buttonH);
    [btn setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor hexStringToColor:@"#f88f35"] forState:UIControlStateDisabled];
    // 设置标题的字体大小
    btn.titleLabel.font = FontSize(10);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    if (index != 2) {
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,15.0, -btn.titleLabel.bounds.size.width)];
        [btn addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    }
    [_tabBarView addSubview:btn];
}
- (void)changeViewController:(PetTabBarBtn *)sender{
    self.selectedIndex = sender.tag;
    if (self.clickBlock) {
        self.clickBlock(self.selectedIndex);
    }
}
- (void)changeViewWithIndex:(NSUInteger)index{
    self.selectedIndex = index; //切换不同控制器的界面
    PetTabBarBtn *btn = _tabBarView.subviews[index];
    btn.enabled = NO;
    if (_previousBtn != btn) {
        _previousBtn.enabled = YES;
    }
    _previousBtn = btn;
}
@end
