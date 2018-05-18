//
//  PublicUtils.m
//  MyLovePet
//
//  Created by zhuxin on 2018/5/18.
//  Copyright © 2018年 zhuxin. All rights reserved.
//

#import "PublicUtils.h"

@implementation PublicUtils

+ (UIFont *)fontJudgeSize:(float)s{
    if (IS_IPHONE6) {
        return [UIFont systemFontOfSize:s+1];
    } else if (IS_IPHONE_6P) {
        return [UIFont systemFontOfSize:s+2];
    } else {
        return [UIFont systemFontOfSize:s];
    }
}

@end
