//
//  DropDownViewController.m
//  PulldownMenu
//
//  Created by Heejun on 16/11/14.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import "DropDownViewController.h"
#import "CVEDropDownBtnView.h"
#import "CVEDropView.h"
#import "dropModel.h"
@interface DropDownViewController ()<CVEDropDownBtnViewDelegate,CVEDropViewDelegate>

@property (nonatomic, strong) CVEDropDownBtnView *btnView;
@property (nonatomic, strong) CVEDropView        *dropView;
@property (nonatomic, strong) dropModel          *dropModel;
@property (nonatomic, strong) UIButton                    *bgBtn;

@end

@implementation DropDownViewController

- (UIButton *)bgBtn{
    if (_bgBtn == nil) {
        _bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64+40, k_ScreenWidth, k_ScreenHeight)];
        _bgBtn.backgroundColor = [UIColor blackColor];
        _bgBtn.alpha = 0.4;
        [_bgBtn addTarget:self action:@selector(removeDropView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgBtn;
}

- (CVEDropDownBtnView *)btnView{
    if (_btnView == nil) {
        _btnView = [[CVEDropDownBtnView alloc] initWithFrame:CGRectMake(0, 64, k_ScreenWidth, 40)];
        _btnView.backgroundColor = [UIColor whiteColor];
                
        _btnView.dropModel = self.dropModel;
        
        _btnView.delegate = self;
    }
    return _btnView;
}

- (dropModel *)dropModel{
    if (_dropModel == nil) {
        _dropModel = [[dropModel alloc] init];
        _dropModel.firstBtnTitle = @"职位";
        _dropModel.firstIsDefault = YES;
        _dropModel.firstViewIsShow = NO;
        
        _dropModel.secondBtnTitle = @"薪资";
        _dropModel.secondIsDefault = YES;
        _dropModel.secondViewIsShow = NO;
        
        _dropModel.thirdBtnTitle = @"工作地点";
        _dropModel.thirdIsDefault = YES;
        _dropModel.thirdViewIsShow = NO;
    }
    return _dropModel;
}

- (CVEDropView *)dropView{
    
    if (_dropView == nil) {
        _dropView = [[CVEDropView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.btnView.frame), k_ScreenWidth, k_ScreenWidth - CGRectGetMaxY(self.btnView.frame))];
        _dropView.delegate = self;
    }
    
    return _dropView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"dropdown";
    
    [self.view addSubview:self.btnView];
}

- (void)cveDropDownBtnViewClicked:(NSInteger)btnIndex{
    
    switch (btnIndex) {
        case 0:
        {
            self.dropModel.firstViewIsShow = YES;
            self.dropModel.secondViewIsShow = NO;
            self.dropModel.thirdViewIsShow = NO;
        }
            break;
        case 1:
        {
            self.dropModel.secondViewIsShow = YES;
            self.dropModel.firstViewIsShow = NO;
            self.dropModel.thirdViewIsShow = NO;
        }
            break;
        case 2:
        {
            self.dropModel.thirdViewIsShow = YES;
            self.dropModel.firstViewIsShow = NO;
            self.dropModel.secondViewIsShow = NO;
        }
            break;
            
        default:
            break;
    }
    
    [self.view addSubview:self.bgBtn];
    [self.view addSubview:self.dropView];
    self.btnView.dropModel = self.dropModel;
    [self.dropView createView:btnIndex];
}

- (void)cveDropDownBtnViewRemoveDropView{
    [self removeDropView];
}

- (void)cveDropViewCellDidClicked:(NSInteger)index Style:(NSInteger)style CellTitle:(NSString *)title{
    
    if (style == 0 && index != 0) {
        //点击第一个btn，不是默认

        self.dropModel.firstBtnTitle = title;
        self.dropModel.firstIsDefault = NO;
    }
    
    if (style == 1 && index != 0) {
        
        self.dropModel.secondIsDefault = NO;
        self.dropModel.secondBtnTitle = title;
        
    }
    
    if (style == 2 && index != 0) {
        
        self.dropModel.thirdIsDefault = NO;
        self.dropModel.thirdBtnTitle = title;
        
    }
    
    if (style == 0 && index == 0) {
        //点击第一个btn，默认
        
        self.dropModel.firstBtnTitle = title;
        self.dropModel.firstIsDefault = YES;
    }
    
    if (style == 1 && index == 0) {
        
        self.dropModel.secondIsDefault = YES;
        self.dropModel.secondBtnTitle = title;
        
    }
    
    if (style == 2 && index == 0) {
        
        self.dropModel.thirdIsDefault = YES;
        self.dropModel.thirdBtnTitle = title;
    
    }
    
    [self removeDropView];
}

- (void)removeDropView{
    self.dropModel.firstViewIsShow = NO;
    self.dropModel.secondViewIsShow = NO;
    self.dropModel.thirdViewIsShow = NO;
    self.btnView.dropModel = self.dropModel;
    [self.dropView removeFromSuperview];
    [self.bgBtn removeFromSuperview];
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
