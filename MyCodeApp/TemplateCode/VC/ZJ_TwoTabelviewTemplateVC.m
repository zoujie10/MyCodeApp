//
//  ZJ_TwoTabelviewTemplateVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/5.
//

#import "ZJ_TwoTabelviewTemplateVC.h"
#import "ZJ_TwoTabelviewTemplateSubVC.h"
static CGFloat topGapHeight = 10;//导航栏下方留白空隙

@interface ZJ_TwoTabelviewTemplateVC ()<UITableViewDelegate,UITableViewDataSource>
///主tableView
@property(nonatomic,strong) UITableView *mainTableView;

@property(nonatomic,strong) ZJ_TwoTabelviewTemplateSubVC *foretasteProductsSubListView;
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
@end
