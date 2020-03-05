//
//  ViewReusePool.m
//  3-1UItableview
//
//  Created by 刘浩宇 on 2020/2/7.
//  Copyright © 2020 Organization. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool()

//等待使用的队列
@property (nonatomic,strong) NSMutableSet * waitUsedQueue;
//使用的队列
@property (nonatomic,strong) NSMutableSet * usingQueue;

@end



@implementation ViewReusePool
- (id)init{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReuseableView{
    UIView *view = [_waitUsedQueue anyObject];
    if (view == nil) {
        return nil;
    }else{
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)addUsingView:(UIView *)view{
    if (!view) {
        return;
    }
    [_usingQueue addObject:view];
}
- (void)reset{
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        [_usingQueue removeObject:view];
        [_waitUsedQueue addObject:view];
    }
}


@end
