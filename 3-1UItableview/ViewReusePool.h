//
//  ViewReusePool.h
//  3-1UItableview
//
//  Created by 刘浩宇 on 2020/2/7.
//  Copyright © 2020 Organization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject

//从重用池中取出一个可重用的view
- (UIView *)dequeueReuseableView;
//向重用池中添加一个视图
- (void)addUsingView:(UIView *)view;
//重置方法，将当前使用的视图移动到可重用队列
- (void)reset;

@end

NS_ASSUME_NONNULL_END
