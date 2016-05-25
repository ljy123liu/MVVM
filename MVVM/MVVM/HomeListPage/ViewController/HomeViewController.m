//
//  HomeViewController.m
//  MVVM
//
//  Created by LIUYONG on 16/3/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "HomeTableViewCell.h"
#import "HomeListModel.h"
#import "HomeViewModel.h"
#import "Define.h"
#import "HomeDetailViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) HomeTableView *homeTableView;
@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self dataAccess];
    
    //JSPatch Test
    [self creatView];
}

#pragma mark - JSPatch Test
- (void)creatView {
    
}

#pragma mark - DataRequest
- (void)dataAccess{
    
    HomeViewModel *homeViewModel= [HomeViewModel new];
    
    __WeakSelf__ wSelf = self;
    [homeViewModel handleDataWithSuccess:^(NSArray *arr) {
        
        [wSelf.dataArray removeAllObjects];
        [wSelf.dataArray addObjectsFromArray:arr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [wSelf.homeTableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
}

#pragma mark - UITableView dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde=@"cellIde";
    HomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIde];
    if (!cell) {
        cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    
    [cell setData:self.dataArray[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeListModel *model=self.dataArray[indexPath.row];
    HomeDetailViewController *homeDetailVC=[HomeDetailViewController new];
    [homeDetailVC setNavTitle:model.newsTitle];
    [homeDetailVC setUrlStr:model.newsLink];
    [self.navigationController pushViewController:homeDetailVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UI
- (void)initUI {
    [self setUpView];
    [self configNav];
}

- (void)setUpView{
    [self.view addSubview:self.homeTableView];
}

- (void)configNav{
    
    self.navigationItem.title = @"iOS头条";
    
    UIButton *settingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setFrame:CGRectMake(0.0, 0.0, 23.0, 23.0)];
    [settingBtn setImage:[UIImage imageNamed:@"navigationbar_setting"] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:settingBtn]];
}

#pragma mark - Setter And Getter
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (HomeTableView *)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[HomeTableView alloc]initWithFrame:self.view.bounds];
        [_homeTableView setDelegate:self];
        [_homeTableView setDataSource:self];
        [_homeTableView setRowHeight:80.0];
    }
    return _homeTableView;
}
@end
