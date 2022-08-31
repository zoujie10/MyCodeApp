//
//  ThirdPartyDemoVC.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/9/21.
//

#import "ThirdPartyDemoVC.h"
#import "BRPickerView.h"
#import "ZJUILabel.h"
#import "YBModelFile.h"
@interface ThirdPartyDemoVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) BRDatePickerView *datePickerView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *thirdPartyName;
@end

@implementation ThirdPartyDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
	self.thirdPartyName = @[@"BRPickerView",@"YBModelFile"];
	ZJUILabel *label = [[ZJUILabel alloc]init];
	[self.view addSubview:label];
	
	label.setAttTextIcon(@"  测试链式语法",@"icon_tabbar_lab_selected",CGRectMake(0, -2, 12, 14))
		.setUpTextColor(UIColor.blackColor);
	label.frame = CGRectMake(100, 100, 200, 30);
	
	[self.view addSubview:self.mainTableView];
	[self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.thirdPartyName.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
	cell.textLabel.text = self.thirdPartyName[indexPath.row];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if(indexPath.row == 0){
		[self pickViewMethod];
	}else if (indexPath.row == 1){
		[self creatDataModel];
	}
}
-(void)pickViewMethod{
	BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
	datePickerView.pickerMode = BRDatePickerModeYMDH;
	datePickerView.maxDate = [NSDate date];
	datePickerView.isAutoSelect = YES;
	datePickerView.showUnitType = BRShowUnitTypeNone;
	datePickerView.title = @"日期选择";
	datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
	};
	//	// 自定义选择器主题样式
		BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
		customStyle.doneTextColor = UIColor.redColor;
		customStyle.titleTextColor = UIColor.blackColor;
		datePickerView.pickerStyle = customStyle;
		
		self.datePickerView = datePickerView;
		self.datePickerView.pickerMode = BRDatePickerModeYM;
		[self.datePickerView show];
	//	// 添加选择器到容器视图
	//	[datePickerView addPickerToView:containerView];
}
-(void)creatDataModel{
	//根据json文件 创建model
	YBMFConfig *config = [YBMFConfig defaultConfig];
	config.framework = YBMFFrameworkMJ;
	[YBModelFile createFileWithName:@"FeedBackListModel" data:@"FeedBackList" config:config];
	
}
- (UITableView *)mainTableView{
	if(!_mainTableView){
		_mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
		_mainTableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
		_mainTableView.delegate = self;
		_mainTableView.dataSource = self;
		_mainTableView.showsVerticalScrollIndicator = NO;
		_mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_mainTableView.backgroundColor = ZJRgbColor(247, 247, 247);
	}
	return _mainTableView;
}
@end
