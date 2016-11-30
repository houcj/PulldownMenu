//
//  CVEDropDownBtnView.m
//  VideoEducation
//
//  Created by Heejun on 16/11/8.
//  Copyright © 2016年 DeTong. All rights reserved.
//

#import "CVEDropDownBtnView.h"

@interface CVEDropDownBtnView ()



@end

@implementation CVEDropDownBtnView

- (void)setDropModel:(dropModel *)dropModel{
    _dropModel = dropModel;
    [self setupBtn];
}

- (void)setupBtn{
    [self.firstBtn setTitle:self.dropModel.firstBtnTitle forState:UIControlStateNormal];
    [self.firstBtn setTitleColor:self.dropModel.firstViewIsShow ? [UIColor greenColor] : (self.dropModel.firstIsDefault  ? [UIColor blackColor] : [UIColor greenColor]) forState:UIControlStateNormal];
    
    [self.secondBtn setTitle:self.dropModel.secondBtnTitle forState:UIControlStateNormal];
    [self.secondBtn setTitleColor:self.dropModel.secondViewIsShow ? [UIColor greenColor] : (self.dropModel.secondIsDefault  ? [UIColor blackColor] : [UIColor greenColor]) forState:UIControlStateNormal];
    
    [self.thirdBtn setTitle:self.dropModel.thirdBtnTitle forState:UIControlStateNormal];
    [self.thirdBtn setTitleColor:self.dropModel.thirdViewIsShow ? [UIColor greenColor] : (self.dropModel.thirdIsDefault  ? [UIColor blackColor] : [UIColor greenColor]) forState:UIControlStateNormal];

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.firstBtn];
        [self addSubview:self.secondBtn];
        [self addSubview:self.thirdBtn];
        [self createView];
    }
    return self;
}

- (UIButton *)firstBtn{
    
    if (_firstBtn == nil) {
        _firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _firstBtn.frame = CGRectMake(0 , 0, (k_ScreenWidth-2) / 3, 39);
        _firstBtn.backgroundColor = [UIColor clearColor];
        _firstBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _firstBtn.tag = 10;
        [_firstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_firstBtn addTarget:self action:@selector(firstBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstBtn;
}

- (UIButton *)secondBtn{
    if (_secondBtn == nil) {
        _secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _secondBtn.frame = CGRectMake((k_ScreenWidth-2) / 3, 0, (k_ScreenWidth-2) / 3, 39);
        _secondBtn.backgroundColor = [UIColor clearColor];
        _secondBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _secondBtn.tag = 10;
        [_secondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_secondBtn addTarget:self action:@selector(secondBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondBtn;
}

- (UIButton *)thirdBtn{
    if (_thirdBtn == nil) {
        _thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _thirdBtn.frame = CGRectMake(0 + ((k_ScreenWidth-2) / 3)*2, 0, (k_ScreenWidth-2) / 3, 39);
        _thirdBtn.backgroundColor = [UIColor clearColor];
        _thirdBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _thirdBtn.tag = 10;
        [_thirdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_thirdBtn addTarget:self action:@selector(thirdBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _thirdBtn;
}

- (void)firstBtnClicked{
    
    if (self.dropModel.firstViewIsShow) {
        if ([self respondsToSelector:@selector(firstBtnClicked)]) {
            [self.delegate cveDropDownBtnViewRemoveDropView];
        }
        
    }else{
        if ([self respondsToSelector:@selector(firstBtnClicked)]) {
            //            [self.delegate cveDropDownBtnViewFirstBtnClicked];
            [self.delegate cveDropDownBtnViewClicked:0];
        }
        
    }
}

- (void)secondBtnClicked{
    
    if (self.dropModel.secondViewIsShow) {
        if ([self respondsToSelector:@selector(secondBtnClicked)]) {
            [self.delegate cveDropDownBtnViewRemoveDropView];
        }
        
    }else{
        if ([self respondsToSelector:@selector(secondBtnClicked)]) {
//            [self.delegate cveDropDownBtnViewSecondBtnClicked];
            [self.delegate cveDropDownBtnViewClicked:1];
        }
    }
}

- (void)thirdBtnClicked{
    
    if (self.dropModel.thirdViewIsShow) {
        if ([self respondsToSelector:@selector(thirdBtnClicked)]) {
            [self.delegate cveDropDownBtnViewRemoveDropView];
        }
    }else{
        if ([self respondsToSelector:@selector(thirdBtnClicked)]) {
//            [self.delegate cveDropDownBtnViewThirdBtnClicked];
            [self.delegate cveDropDownBtnViewClicked:2];
        }
    }
}

- (void)createView{
   
    for (int i = 0; i < 2; i ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake((k_ScreenWidth-2) / 3 + (k_ScreenWidth-2) / 3 * i + 1*i, 0, 0.5, 39)];
        view.backgroundColor = [UIColor grayColor];
        [self addSubview:view];
    }
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, k_ScreenWidth, 1)];
    bottomView.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomView];
}

@end
