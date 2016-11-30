//
//  CVEDropDownViewController.m
//  VideoEducation
//
//  Created by Heejun on 16/11/8.
//  Copyright © 2016年 DeTong. All rights reserved.
//

#import "CVEDropDownViewController.h"
#import "CVEDropDownBtnView.h"
#import "CVEDropView.h"
@interface CVEDropDownViewController ()<CVEDropDownBtnViewDelegate,CVEDropViewDelegate>

@property (nonatomic, strong) CVEDropDownBtnView *btnView;
@property (nonatomic, strong) CVEDropView        *dropView;

@end

@implementation CVEDropDownViewController

- (CVEDropDownBtnView *)btnView{
    if (_btnView == nil) {
        _btnView = [[CVEDropDownBtnView alloc] initWithFrame:CGRectMake(0, 0, k_ScreenWidth, 40)];
        _btnView.backgroundColor = [UIColor whiteColor];
        _btnView.btnTitleArr = @[@"职位",@"价格",@"工作地点"];
        _btnView.delegate = self;
    }
    return _btnView;
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
    self.navigationController.title = @"dropdown";
    
    [self.view addSubview:self.btnView];
}

- (void)cveDropDownBtnViewFirstBtnClicked{
    
    [self.view addSubview:self.dropView];
    
    [self.dropView createView:0];
}

- (void)cveDropDownBtnViewSecondBtnClicked{
    [self.view addSubview:self.dropView];
    [self.dropView createView:1];
}

- (void)cveDropDownBtnViewThirdBtnClicked{
    [self.view addSubview:self.dropView];
    [self.dropView createView:2];
}

- (void)cveDropDownBtnViewRemoveDropView{
    [self.dropView removeFromSuperview];
}

- (void)cveDropViewCellDidClicked:(NSInteger)index Style:(NSInteger)style{
    
    if (style == 1 && index != 0) {
        self.btnView.secondBtnSelected = YES;
        self.btnView.secondBtn.selected = YES;
    }
    
    if (style == 2 && index != 0) {
        self.btnView.thirdBtnSelected = YES;
        self.btnView.thirdBtn.selected = YES;
    }
    
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
