//
//  SecondaryListView.h
//  PulldownMenu
//
//  Created by Heejun on 16/11/30.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SecondaryListViewDelegate <NSObject>

- (void)SecondaryListViewCellDidClicked:(NSInteger)index Title:(NSString *)title;

@end
@interface SecondaryListView : UIView

@property (nonatomic, strong) NSArray *firstArr;
@property (nonatomic, strong) NSArray *secondArr;

@property (nonatomic, weak) id<SecondaryListViewDelegate> delegate;

@end
