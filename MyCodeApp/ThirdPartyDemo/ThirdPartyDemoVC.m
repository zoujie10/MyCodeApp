//
//  ThirdPartyDemoVC.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/9/21.
//

#import "ThirdPartyDemoVC.h"
#import "BRPickerView.h"

@interface ThirdPartyDemoVC ()
@property (nonatomic, strong) BRDatePickerView *datePickerView;
@end

@implementation ThirdPartyDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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

@end
