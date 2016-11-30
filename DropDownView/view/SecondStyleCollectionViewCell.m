//
//  SecondStyleCollectionViewCell.m
//  PulldownMenu
//
//  Created by Heejun on 16/11/29.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import "SecondStyleCollectionViewCell.h"

@implementation SecondStyleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, k_ScreenWidth, 50)];
        [self addSubview:self.titleLabel];
        
        self.titleLabel.backgroundColor = randomColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

@end
