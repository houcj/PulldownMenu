//
//  dropModel.h
//  PulldownMenu
//
//  Created by Heejun on 16/11/23.
//  Copyright © 2016年 houchunjiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dropModel : NSObject

@property (nonatomic, assign) BOOL     firstIsDefault;
@property (nonatomic, assign) BOOL     secondIsDefault;
@property (nonatomic, assign) BOOL     thirdIsDefault;

@property (nonatomic, assign) BOOL     firstViewIsShow;
@property (nonatomic, assign) BOOL     secondViewIsShow;
@property (nonatomic, assign) BOOL     thirdViewIsShow;

@property (nonatomic, strong) NSString *firstBtnTitle;
@property (nonatomic, strong) NSString *secondBtnTitle;
@property (nonatomic, strong) NSString *thirdBtnTitle;

@end
