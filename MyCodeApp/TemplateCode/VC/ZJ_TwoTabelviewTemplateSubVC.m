//
//  ZJ_TwoTabelviewTemplateSubVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/5.
//

#import "ZJ_TwoTabelviewTemplateSubVC.h"

@interface ZJ_TwoTabelviewTemplateSubVC ()
@property(nonatomic, strong)UITableView *rightTableView;
@property(nonatomic, strong)UITableView *leftTableView;
@end

@implementation ZJ_TwoTabelviewTemplateSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
	[self creatUI];
}
#pragma mark makeUI
-(void)creatUI{
//	[self.view addSubview:self.searchTitleView];
	[self.view addSubview:self.leftTableView];
	[self.view addSubview:self.rightTableView];
	
//	[self.searchTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.left.top.right.equalTo(self.view);
//		make.height.mas_equalTo(55);
//	}];
	
	[self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.view).offset(5);
		if (@available(iOS 11.0, *)) {
			make.bottom.equalTo(self.view.mas_bottom).offset(0);
		}else{
			make.bottom.equalTo(self.view.mas_bottom).offset(-45);//ios 10
		}
		make.left.equalTo(self.view);
		make.width.mas_equalTo(86);
	}];
	[self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.view).offset(5);
		if (@available(iOS 11.0, *)) {
			make.bottom.equalTo(self.view.mas_bottom).offset(0);
		}else{
			make.bottom.equalTo(self.view.mas_bottom).offset(-45);//iOS 10
		}
		make.left.equalTo(self.leftTableView.mas_right);
		make.right.equalTo(self.view);
	}];
}

#pragma mark delegate
//代理UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSInteger num;
//	if (tableView==self.leftTableView) {
//		num = [self.leftTagViewModel ww_getArrayCount];
//	}else{
//		num = [self.rightDetailListViewModel ww_getArrayCount];
//	}
	return num;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	if (tableView == self.leftTableView) {
//		WWBDSecondPageLeftCell *leftCell =
//		[tableView dequeueReusableCellWithIdentifier:@"leftCell"
//										forIndexPath:indexPath];
//		leftCell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//		leftCell.titleLabel.text = [self.leftTagViewModel ww_getTitleFor:indexPath];
//		if ([self.leftTagViewModel ww_getIsSelectCell:indexPath]) {
//			leftCell.titleLabel.textColor = [UIColor colorWithRed:252/255.0
//															green:85/255.0
//															 blue:108/255.0
//															alpha:1.0];
//			leftCell.contentView.backgroundColor = [UIColor whiteColor];
//			leftCell.lineView.hidden = NO;
//			leftCell.titleLabel.font = [UIFont boldSystemFontOfSize:14];
//		} else {
//			leftCell.titleLabel.textColor = [UIColor colorWithHexStringMethod:@"#85868A"];
//			leftCell.contentView.backgroundColor = [UIColor colorWithHexStringMethod:@"f7f7f7"];
//			leftCell.lineView.hidden = YES;
//			leftCell.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//		}
//		return leftCell;
//
//	}else{
//
//		WWBDSecondPageReportsContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(WWBDSecondPageReportsContentCell.class) forIndexPath:indexPath];
//		cell.label.text = [self.rightDetailListViewModel ww_getPDFTitleFor:indexPath];
//		NSString *url = [self.rightDetailListViewModel ww_getPDFAttachmentUrlFor:indexPath];
//		cell.downloadButton.hidden = !(url != nil && url.length > 0);
//		WWeakSelf;
//		cell.downloadAction = ^{
//			NSString *fileName = [weakSelf.rightDetailListViewModel ww_getPDFAttachmentNameFor:indexPath];
//			WWeakSelf;
//			[WWSystemActivityManager systemShareInVC:weakSelf FileName:fileName FileUrl:url Complete:^{
//				// 保存成功
//				WWLog(@"======= 保存成功 =======");
//			} Error:^(NSString * _Nonnull message) {
//				[weakSelf showTipWithMessage:message];
//			}];
//		};
//		return cell;
//	}
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 56;
}
#pragma mark -  leftTableView rightTableView实现联动 : rightTableViews顶部section头消失出现 实现 leftTableView选择联动
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[tableView deselectRowAtIndexPath:indexPath
							 animated:NO];
//	WWeakSelf;
//	if (tableView == self.leftTableView) {
//		kPreventRepeatClickTime(1);
//		[self.leftTagViewModel ww_setSelectdCellFor:indexPath.row];
//		[self.leftTableView reloadData];
//		[self.leftTableView selectRowAtIndexPath:indexPath
//										animated:YES
//								  scrollPosition:UITableViewScrollPositionMiddle];//左侧选择了也需要更新 否则在tableview didEndDisplayingFooterView滚动回调  更新选择时 会影响这里
//		NSString *parentId = [self.leftTagViewModel ww_getDetailParentIdFor:indexPath.row];
//		[self requestDetailList:parentId];
//	}else {
//		WWBDWantCollegeContentVC *vc = [[WWBDWantCollegeContentVC alloc]init];
//		vc.attachmentName = [self.rightDetailListViewModel ww_getPDFAttachmentNameFor:indexPath];
//		vc.attachmentUrl = [self.rightDetailListViewModel ww_getPDFAttachmentUrlFor:indexPath];
//		vc.content = [self.rightDetailListViewModel ww_getPDFContentFor:indexPath];
//		vc.contentName = [self.rightDetailListViewModel ww_getPDFTitleFor:indexPath];
//		vc.title = weakSelf.title;
//		vc.showWaterMark = !(vc.attachmentUrl.length > 0);
//		[self.navigationController pushViewController:vc animated:YES];
//	}
}
#pragma mark lazyload
- (UITableView *)leftTableView{
	if (!_leftTableView) {
		_leftTableView =
		[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		_leftTableView.delegate = self;
		_leftTableView.dataSource = self;
		_leftTableView.showsVerticalScrollIndicator = NO;
		_leftTableView.bounces = YES;
//		[_leftTableView registerClass:[WWBDSecondPageLeftCell class]
//			   forCellReuseIdentifier:@"leftCell"];
//		_leftTableView.backgroundColor = [UIColor colorWithHexStringMethod:@"f7f7f7"];
		_leftTableView.tableFooterView = [UIView new];
//		_leftTableView.separatorColor = [UIColor colorWithHexStringMethod:@"#E4E8ED"];
		if (@available(iOS 11.0, *)) {
			_leftTableView.estimatedRowHeight = 0;//iOS11后会预估高度 contensize等于estimatedRowHeight（默认44）*cell数量，导致进入页面马上又跳转时会保留计算不准确的contentsize
			_leftTableView.estimatedSectionFooterHeight = 0;
			_leftTableView.estimatedSectionHeaderHeight = 0;
			// 作用于指定的UIScrollView
			_leftTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
		} else {
			self.automaticallyAdjustsScrollViewInsets = NO;
		}
	}
	return _leftTableView;
}

- (UITableView *)rightTableView{
	if (!_rightTableView) {
		_rightTableView =
		[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		_rightTableView.delegate = self;
		_rightTableView.dataSource = self;
		_rightTableView.showsVerticalScrollIndicator = NO;
		_rightTableView.bounces = YES;
//		[_rightTableView registerClass:[WWBDSecondPageReportsContentCell class]
//				forCellReuseIdentifier:NSStringFromClass(WWBDSecondPageReportsContentCell.class)];
		_rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_rightTableView.backgroundColor = [UIColor whiteColor];
		_rightTableView.tableFooterView = [UIView new];
		
		if (@available(iOS 11.0, *)) {
			_rightTableView.estimatedRowHeight = 0;//iOS11后会预估高度 contensize等于estimatedRowHeight（默认44）*cell数量，导致进入页面马上又跳转时会保留计算不准确的contentsize
			_rightTableView.estimatedSectionFooterHeight = 0;
			_rightTableView.estimatedSectionHeaderHeight = 0;
			_rightTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
		} else {
			self.automaticallyAdjustsScrollViewInsets = NO;
		}
	}
	return _rightTableView;
}

@end
