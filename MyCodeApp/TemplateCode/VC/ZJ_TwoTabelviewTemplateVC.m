//
//  ZJ_TwoTabelviewTemplateVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/5.
//

#import "ZJ_TwoTabelviewTemplateVC.h"

static CGFloat topGapHeight = 10;//导航栏下方留白空隙
static NSString *cellId = @"CellSubScrollView";

@interface ZJ_TwoTabelviewTemplateVC ()<UITableViewDelegate,UITableViewDataSource>
///主tableView
@property(nonatomic,strong) UITableView *mainTableView;

@end

@implementation ZJ_TwoTabelviewTemplateVC

- (void)viewDidLoad {
    [super viewDidLoad];
	self.edgesForExtendedLayout = UIRectEdgeNone;
	self.view.backgroundColor = [UIColor whiteColor];
	[self creatUI];
}
-(void)configRightNavBtn{
	UIButton *btnRuler = [UIButton buttonWithType:UIButtonTypeCustom];
	[btnRuler setTitle:@"  右-导航栏按钮" forState:UIControlStateNormal];
	[btnRuler setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
	[btnRuler setImage:[UIImage imageNamed:@"ww_bd_foretoast_product_list_navi_icon"] forState:UIControlStateNormal];
	[btnRuler setImage:[UIImage imageNamed:@"ww_bd_foretoast_product_list_navi_icon"] forState:UIControlStateHighlighted];
	[btnRuler.titleLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]];
	[btnRuler addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRuler];
}
-(void)rightClick{}

- (void)creatUI{
	[self.view addSubview:self.mainTableView];
	[self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, kNavBarHeight, 0));
	}];

	self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
	
}
#pragma mark delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
	 if (!cell) {
		  cell =
		  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
								 reuseIdentifier:cellId];
//		  [cell.contentView addSubview:self.subListView.view];
		  cell.backgroundColor = [UIColor whiteColor];
		  cell.selectionStyle = UITableViewCellSelectionStyleNone;
	 }
	return cell;
}
/**
 UITableViewDelegate
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 10;
}

#pragma mark lazyload
-(UITableView *)mainTableView{
	if (!_mainTableView) {
		_mainTableView =
		[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		_mainTableView.showsVerticalScrollIndicator = NO;
		_mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		//设置代理
		_mainTableView.delegate = self;
		_mainTableView.dataSource = self;
		_mainTableView.bounces = NO;
	}
	return _mainTableView;
}


@end
