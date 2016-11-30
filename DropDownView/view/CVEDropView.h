//
//  CVEDropView.h
//  VideoEducation
//
//  Created by Heejun on 16/11/9.
//  Copyright © 2016年 DeTong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CVEDropViewDelegate <NSObject>

- (void)cveDropViewCellDidClicked:(NSInteger)index Style:(NSInteger)style CellTitle:(NSString *)title;

@end
@interface CVEDropView : UIView

@property (nonatomic, assign)id<CVEDropViewDelegate> delegate;

- (void)createView:(NSInteger )index;

@end
