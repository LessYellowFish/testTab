//
//  ViewController.m
//  3-1UItableview
//
//  Created by 刘浩宇 on 2020/2/7.
//  Copyright © 2020 Organization. All rights reserved.
//

#import "ViewController.h"
#import "IndexedTableview.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,IndexedTableViewDataSource>
{
    IndexedTableview *tableView;
    UIButton *button;
    NSMutableArray *dataSource;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    tableView = [[IndexedTableview alloc]initWithFrame:CGRectMake(0, 60, self.self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.indexDataSource = self;

    [self.view addSubview:tableView];

    button = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];

    dataSource = [NSMutableArray array];
    for (int i = 0; i<999; i++) {
        [dataSource addObject:@(i+1)];
    }

    UIView *view  = [[UIView alloc] init];
    NSArray *array= view.subviews;
    for (UIView *view1 in array) {
        NSLog(@"%@",view1);
    }
}


- (NSArray<NSString *> *)indexTitleForIndexTableView:(UITableView *)tableview{
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K"];
    }else{
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [dataSource count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    cell.textLabel.text = [[dataSource objectAtIndex:indexPath.row] stringValue];

    return cell;
}

- (void)doAction:(id)sender{
    [tableView reloadData];
}

@end
