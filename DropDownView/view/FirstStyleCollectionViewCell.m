//
//  FirstStyleCollectionViewCell.m
//  PulldownMenu
//
//  Created by Heejun on 16/11/29.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import "FirstStyleCollectionViewCell.h"

@implementation FirstStyleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (k_ScreenWidth - 3)/4, 100)];
        [self addSubview:self.titleLable];
        
        self.titleLable.backgroundColor = randomColor;
        self.titleLable.textColor = [UIColor whiteColor];
    }
    return self;
}

@end
