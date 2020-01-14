//
//  HomeController.m
//  CXCCF
//
//  Created by 李霆 on 2019/11/15.
//  Copyright © 2019 CX. All rights reserved.
//

#import "HomeController.h"
#import "HomeTableViewCell.h"
#import "EasyBookDetailVC.h"

@interface HomeController ()<UITableViewDelegate,UITableViewDataSource>

/***dataArr  ****/
@property(nonatomic,strong) NSMutableArray *dataArr;
/*** tableView ****/
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.title = @"效果集合";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 60;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HomeTableViewCell class])];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = rgb(243, 244, 250,1);
    [self.view addSubview:self.tableView];
    
    [self creatData];

}

- (void)creatData{
    self.dataArr = [NSMutableArray arrayWithObjects:@"高仿简书文章详情界面", nil];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class])];
    cell.titleLab.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EasyBookDetailVC * view = [[EasyBookDetailVC alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}



@end
