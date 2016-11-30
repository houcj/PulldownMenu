//
//  CVEDropDownBtnView.h
//  VideoEducation
//
//  Created by Heejun on 16/11/8.
//  Copyright © 2016年 DeTong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dropModel.h"

@protocol CVEDropDownBtnViewDelegate <NSObject>

//- (void)cveDropDownBtnViewFirstBtnClicked;
//- (void)cveDropDownBtnViewSecondBtnClicked;
//- (void)cveDropDownBtnViewThirdBtnClicked;
- (void)cveDropDownBtnViewRemoveDropView;

- (void)cveDropDownBtnViewClicked:(NSInteger)btnIndex;

@end
@interface CVEDropDownBtnView : UIView

@property (nonatomic, strong) UIButton *firstBtn;
@property (nonatomic, strong) UIButton *secondBtn;
@property (nonatomic, strong) UIButton *thirdBtn;

@property (nonatomic, strong) dropModel *dropModel;

@property (nonatomic, assign) id<CVEDropDownBtnViewDelegate> delegate;

@end
