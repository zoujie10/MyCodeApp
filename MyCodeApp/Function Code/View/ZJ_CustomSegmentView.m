//
//  ZJ_CustomSegmentView.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/20.
//

#import "ZJ_CustomSegmentView.h"
@interface ZJ_CustomSegmentView()
@property(nonatomic,strong) UIView *btnBackView;
@property(nonatomic,strong) UIView *animationBgView;
@end
@implementation ZJ_CustomSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = UIColor.whiteColor;
		self.userInteractionEnabled = YES;
		[self initContentView];
	}
	return self;
}
-(void)initContentView{
	self.btnBackView = [[UIView alloc]init];
	self.btnBackView.layer.cornerRadius = 16;
	self.btnBackView.backgroundColor = ZJRgbColorA(65, 111, 252, 0.2);//rgba(41, 110, 250, 1)
	[self addSubview:self.btnBackView];
	
	self.animationBgView = [[UIView alloc]init];
	self.animationBgView.layer.cornerRadius = 12;
	CGFloat btnWidth = 65;
	[self.btnBackView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(btnWidth*2);
		make.height.mas_equalTo(25);
		make.centerX.mas_equalTo(self.mas_centerX);
		make.top.mas_equalTo(self).offset(10);
	}];
	[self.btnBackView addSubview:self.animationBgView];
	[self.btnBackView addSubview:self.allBtn];
	[self.btnBackView addSubview:self.threeMonthsBtn];
	
	[self.allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.left.height.equalTo(self.btnBackView);
		make.width.mas_equalTo(@70);
	}];
	
	[self.threeMonthsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.height.right.equalTo(self.btnBackView);
		make.width.mas_equalTo(@70);
	}];
	
	[self addSubview:self.searchImageBtn];
	[self.searchImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.size.mas_equalTo(CGSizeMake(20, 20));
		make.centerY.mas_equalTo(self.btnBackView.mas_centerY);
		make.right.mas_equalTo(self).offset(-15);
	}];
	
	[self.animationBgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.height.right.equalTo(self.btnBackView);
		make.width.mas_equalTo(@70);
	}];
	self.animationBgView.backgroundColor = ZJRgbColorA(65, 111, 252, 1);
}
-(void)selectAllDate:(UIButton *)sender{
	if (sender.selected == YES) return;
	[self.btnBackView bringSubviewToFront:sender];
	self.threeMonthsBtn.selected = sender.selected;
	self.allBtn.selected = !sender.selected;
	[UIView animateWithDuration:1 animations:^{
		[self.animationBgView setOriginX:70];
	}];
	
	if(self.click_type_block){
		self.click_type_block(SelectAndSearch_All);
	}
}
-(void)selectThreeDate:(UIButton *)sender{
	if (sender.selected == YES) return;
	[self.btnBackView bringSubviewToFront:sender];
	self.allBtn.selected = sender.selected;
	self.threeMonthsBtn.selected = !sender.selected;
	[UIView animateWithDuration:1 animations:^{
		[self.animationBgView setOriginX:self.threeMonthsBtn.originX];
	}];
	
	if(self.click_type_block){
		self.click_type_block(SelectAndSearch_ThreeMonth);
	}
}
-(void)searchData:(UIButton *)sender{
	if(self.click_type_block){
		self.click_type_block(SelectAndSearch_Search);
	}
}

#pragma mark Lazy load
- (UIButton *)allBtn{
	if(!_allBtn){
		_allBtn = [[UIButton alloc]init];
		[_allBtn setTitle:@"全部" forState:UIControlStateNormal];
		[_allBtn setBackgroundColor:UIColor.clearColor];
		[_allBtn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
		[_allBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
		[_allBtn setBackgroundImage:[UIImage imageWithColor:ZJRgbColorA(65, 111, 252, 1)] forState:UIControlStateSelected];
		[_allBtn setBackgroundImage:[UIImage imageWithColor:ZJRgbColorA(65, 111, 252, 0.2)] forState:UIControlStateNormal];
		_allBtn.clipsToBounds = YES;
		[_allBtn addTarget:self action:@selector(selectAllDate:) forControlEvents:UIControlEventTouchUpInside];
		_allBtn.titleLabel.font = ZJFONTBOLD(13);
		_allBtn.layer.cornerRadius = 12;
	}
	return _allBtn;
}
- (UIButton *)threeMonthsBtn{
	if(!_threeMonthsBtn){
		_threeMonthsBtn = [[UIButton alloc]init];
		[_threeMonthsBtn setTitle:@"近6月" forState:UIControlStateNormal];
		_threeMonthsBtn.backgroundColor = ZJRgbColor(252, 85, 108);
		[_threeMonthsBtn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
		[_threeMonthsBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
		[_threeMonthsBtn setBackgroundImage:[UIImage imageWithColor:ZJRgbColorA(65, 111, 252, 1)] forState:UIControlStateSelected];
		[_threeMonthsBtn setBackgroundImage:[UIImage imageWithColor:ZJRgbColorA(65, 111, 252, 0.2)] forState:UIControlStateNormal];
		_threeMonthsBtn.clipsToBounds = YES;
		[_threeMonthsBtn addTarget:self action:@selector(selectThreeDate:) forControlEvents:UIControlEventTouchUpInside];
		_threeMonthsBtn.titleLabel.font = ZJFONTBOLD(13);
		_threeMonthsBtn.selected = YES;
		_threeMonthsBtn.layer.cornerRadius = 12;
	}
	return _threeMonthsBtn;
}
- (UIButton *)searchImageBtn{
	if(!_searchImageBtn){
		_searchImageBtn = [[UIButton alloc]init];
		[_searchImageBtn setImage:[UIImage imageNamed:@"button_selected"] forState:UIControlStateNormal];
		[_searchImageBtn addTarget:self action:@selector(searchData:) forControlEvents:UIControlEventTouchUpInside];
		_searchImageBtn.hidden = YES;
	}
	return _searchImageBtn;
}
@end
