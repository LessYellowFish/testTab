//
//  IndexedTableview.m
//  3-1UItableview
//
//  Created by 刘浩宇 on 2020/2/7.
//  Copyright © 2020 Organization. All rights reserved.
//

#import "IndexedTableview.h"
#import "ViewReusePool.h"


@interface IndexedTableview()
{
    UIView *containerView;
    ViewReusePool *reusePool;
}

@end




@implementation IndexedTableview

- (void)reloadData{
    [super reloadData];
    if (containerView == nil) {
        containerView = [[UIView alloc]initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];

        //避免索引跟着
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc]init];
    }

//    标记所有视图为可重用状态
    [reusePool reset];

//    reload字母索引列表
    [self reloadIxedBar];
}

- (void)reloadIxedBar{
    for (UIButton *btn in containerView.subviews) {
        [btn removeFromSuperview];
    }
//    获取字母索引条的显示内容
    NSArray <NSString *>*arrayTitles = nil;
    if ([self.indexDataSource respondsToSelector:@selector(indexTitleForIndexTableView:)]) {
        arrayTitles = [self.indexDataSource indexTitleForIndexTableView:self];
    }

    if (arrayTitles==nil || arrayTitles.count<=0) {
        [containerView setHidden:YES];
        return;
    }
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;

    for (int i = 0; i<[arrayTitles count]; i++) {
        NSString *title = [arrayTitles objectAtIndex:i];

        UIButton *button = (UIButton *)[reusePool dequeueReuseableView];

        if (button == nil) {
            button = [[UIButton alloc]initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];

            [reusePool addUsingView:button];
            NSLog(@"创建并注册到池中");
        }else{
            NSLog(@"池中重用的");
        }

        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, i*buttonHeight, buttonWidth, buttonHeight)];

    }
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width-buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);

    NSLog(@"%zd,GHJK",containerView.subviews.count);
}
@end
