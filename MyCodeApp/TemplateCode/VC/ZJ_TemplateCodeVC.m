//
//  ZJ_TemplateCodeVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/24.
//

#import "ZJ_TemplateCodeVC.h"
#import "ZJ_NormalDetailTitleCell.h"

@interface ZJ_TemplateCodeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@end

@implementation ZJ_TemplateCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"";
	[self configUI];
	[self requestData];
}
-(void)configUI{
	[self.view addSubview:self.myTableView];
	[self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
}
-(void)requestData{
	
}
#pragma mark --UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	NSInteger count = 10;
	return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *identifier = @"ZJ_NormalDetailTitleCell";
	ZJ_NormalDetailTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ZJ_NormalDetailTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	return cell;
}

#pragma mark lazy load
- (UITableView *)myTableView{
	if (!_myTableView) {
		_myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		_myTableView.backgroundColor = UIColor.whiteColor;
		_myTableView.dataSource = self;
		_myTableView.delegate = self;
		_myTableView.showsVerticalScrollIndicator = NO;
		_myTableView.showsHorizontalScrollIndicator = NO;
		_myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		if (@available(iOS 7.0, *)) {
			UITableView.appearance.estimatedRowHeight = 0;
		}
		if (@available(iOS 11.0, *)){
			_myTableView.estimatedRowHeight = 0;
			_myTableView.estimatedSectionHeaderHeight = 0;
			_myTableView.estimatedSectionFooterHeight = 0;
		}
//		[_myTableView registerClass:Cell.self forCellReuseIdentifier:NSStringFromClass(Cell.self)];
//		[_myTableView registerClass:[Header class]
//	forHeaderFooterViewReuseIdentifier:@"headerView"];
	
		
		[self.view addSubview:_myTableView];
	}
	return _myTableView;
}

@end
