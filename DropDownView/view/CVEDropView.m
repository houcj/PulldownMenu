//
//  CVEDropView.m
//  VideoEducation
//
//  Created by Heejun on 16/11/9.
//  Copyright © 2016年 DeTong. All rights reserved.
//

#import "CVEDropView.h"

#import "FirstStyleCollectionViewCell.h"
#import "SecondStyleCollectionViewCell.h"
#import "SecondaryListView.h"
@interface CVEDropView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SecondaryListViewDelegate>

@property (nonatomic, assign) NSInteger                    selectedSecondCellIndex;
@property (nonatomic, assign) NSInteger                    selectedthirdCellIndex;
@property (nonatomic, assign) NSInteger                    selectedBtnIndex;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SecondaryListView *secondaryListView;
@property (nonatomic, strong) NSArray                     *firstArr;
@property (nonatomic, strong) NSArray                     *secondArr;
@property (nonatomic, strong) NSArray                     *thirdArr;

@end

#define firstCellId        @"firstCell"
#define secondCellId       @"secondCell"
#define thirdCellId        @"thirdCell"

@implementation CVEDropView

- (NSArray *)firstArr{
    if (_firstArr == nil) {
        _firstArr = [NSArray arrayWithObjects:@"全部",@"2",@"3",@"4",@"5",@"6", nil];
    }
    return _firstArr;
}

- (NSArray *)secondArr{
    if (_secondArr == nil) {
        _secondArr = [NSArray arrayWithObjects:@"全部",@"免费",@"收费", nil];
    }
    return _secondArr;
}

- (NSArray *)thirdArr{
    if (_thirdArr == nil) {
        _thirdArr = [NSArray arrayWithObjects:@"综合排序",@"最新排序", nil];
    }
    return _thirdArr;
}

- (SecondaryListView *)secondaryListView{
    if (_secondaryListView == nil) {
        _secondaryListView = [[SecondaryListView alloc] initWithFrame:CGRectMake(0, 0, k_ScreenWidth, 200)];
        _secondaryListView.delegate = self;
    }
    return _secondaryListView;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, k_ScreenWidth, 200) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[SecondStyleCollectionViewCell class] forCellWithReuseIdentifier:secondCellId];
        [_collectionView registerClass:[FirstStyleCollectionViewCell class] forCellWithReuseIdentifier:firstCellId];
    }
    return _collectionView;
}

- (void)SecondaryListViewCellDidClicked:(NSInteger)index Title:(NSString *)title{
    if ([self respondsToSelector:@selector(SecondaryListViewCellDidClicked:Title:)]) {
        [self.delegate cveDropViewCellDidClicked:index Style:_selectedBtnIndex CellTitle:title];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (_selectedBtnIndex) {
        case 0:
        {
            [self.delegate cveDropViewCellDidClicked:indexPath.row Style:_selectedBtnIndex CellTitle:[self.firstArr objectAtIndex:indexPath.row]];
        }
        
            break;
        case 1:
        {
            [self.delegate cveDropViewCellDidClicked:indexPath.row Style:_selectedBtnIndex CellTitle:[self.secondArr objectAtIndex:indexPath.row]];
        }
            break;
            
        default:
            break;
    }
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (_selectedBtnIndex) {
        case 0:
        {
            FirstStyleCollectionViewCell *cell = [[FirstStyleCollectionViewCell alloc] init];
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstCellId forIndexPath:indexPath];
            cell.titleLable.text = [self.firstArr objectAtIndex:indexPath.row];
//                cell = [[FirstStyleCollectionViewCell alloc] init];
            
            return cell;
        }
            break;
        case 1:
        {
            SecondStyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondCellId forIndexPath:indexPath];
            cell.titleLabel.text = [self.secondArr objectAtIndex:indexPath.row];
            
//                cell = [[SecondStyleCollectionViewCell alloc] init];
            
            return cell;
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
    return [UICollectionViewCell new];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (_selectedBtnIndex) {
        case 0:
        {
            return self.firstArr.count;
        }
            break;
        case 1:
        {
            return self.secondArr.count;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (_selectedBtnIndex) {
        case 0:
            return CGSizeMake((k_ScreenWidth - 3)/4, 100);
            break;
        case 1:
            return CGSizeMake(k_ScreenWidth, 50);
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
    return CGSizeMake(0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)createView:(NSInteger)index{
    _selectedBtnIndex = index;
    if (_selectedBtnIndex == 2) {
        [self.collectionView removeFromSuperview];
        [self addSubview:self.secondaryListView];
    }else{
        [self.secondaryListView removeFromSuperview];
        [self addSubview:self.collectionView];
        [self.collectionView reloadData];
    }
}


@end
