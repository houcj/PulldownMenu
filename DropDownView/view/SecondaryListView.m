//
//  SecondaryListView.m
//  PulldownMenu
//
//  Created by Heejun on 16/11/30.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import "SecondaryListView.h"

@interface SecondaryListView ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat selfWight;
    CGFloat selfHeight;
}

@property (nonatomic, strong) UITableView *firstTableView;
@property (nonatomic, strong) UITableView *secondTableView;

@end

@implementation SecondaryListView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        selfWight = frame.size.width;
        selfHeight = frame.size.height;
        [self setupView];
    }
    return self;
}

- (void)setupView{
    [self addSubview:self.secondTableView];
    [self addSubview:self.firstTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        [self.secondTableView reloadData];
    }else{
        [self.delegate SecondaryListViewCellDidClicked:indexPath.row Title:[self.secondArr objectAtIndex:indexPath.row]];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 10) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCellId"];
        cell.textLabel.text = [self.firstArr objectAtIndex:indexPath.row];
        cell.backgroundColor = randomColor;
        if (indexPath.row == 0) {
            cell.selected = YES;
        }
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondCellId"];
        cell.textLabel.text = [NSString stringWithFormat:@"second-%@",[self.secondArr objectAtIndex:indexPath.row]];
        cell.backgroundColor = randomColor;
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 10) {
        return self.firstArr.count;
    }else{
        return self.secondArr.count ;
    }
}

- (UITableView *)firstTableView{
    if (_firstTableView == nil) {
        _firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWight/3, selfHeight) style:UITableViewStylePlain];
        _firstTableView.tag = 10;
        _firstTableView.dataSource = self;
        _firstTableView.delegate = self;
    }
    return _firstTableView;
}

- (UITableView *)secondTableView{
    if (_secondTableView == nil) {
        _secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(selfWight/3, 0, selfWight/3*2, selfHeight) style:UITableViewStylePlain];
        _secondTableView.tag = 11;
        _secondTableView.delegate = self;
        _secondTableView.dataSource = self;
        _secondTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _secondTableView;
}

- (NSArray *)firstArr{
    if (_firstArr == nil) {
        _firstArr = [NSArray arrayWithObjects:@"first1",@"first2",@"first3",@"first4", nil];
    }
    return _firstArr;
}

- (NSArray *)secondArr{
    if (_secondArr == nil) {
        _secondArr = [NSArray arrayWithObjects:@"全部",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18", nil];
    }
    return _secondArr;
}

@end
