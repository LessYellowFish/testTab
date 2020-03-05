//
//  IndexedTableview.h
//  3-1UItableview
//
//  Created by 刘浩宇 on 2020/2/7.
//  Copyright © 2020 Organization. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol IndexedTableViewDataSource <NSObject>

- (NSArray <NSString *> *)indexTitleForIndexTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_BEGIN


@interface IndexedTableview : UITableView

@property (nonatomic,weak) id <IndexedTableViewDataSource> indexDataSource;

@end

NS_ASSUME_NONNULL_END
