//
//  ZJ_TemplateHeaderView.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/1.
//

#import "ZJ_TemplateHeaderView.h"

@implementation ZJ_TemplateHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithReuseIdentifier:reuseIdentifier];
	if (self) {
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	self.bgView = [[UIView alloc]init];
	self.bgView.backgroundColor = UIColor.clearColor;
	[self addSubview:self.bgView];
	
	[self.bgView addSubview:self.titleLabel];
	[self.bgView addSubview:self.titileIconBtn];
	[self.bgView addSubview:self.detailTextLbl];
	[self.bgView addSubview:self.selectBtn];
	
	self.line = [[UIView alloc]init];
//	self.line.backgroundColor = WWRgbColorA(153, 153, 153, 0.8);
	[self.bgView addSubview:self.line];
	
	[self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self);
	}];
	
	[self.line mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(self.bgView).offset(-5);
		make.left.mas_equalTo(self.bgView).offset(15).priorityHigh();
		make.right.mas_equalTo(self.bgView).offset(-15);
		make.height.mas_equalTo(@0.2);
	}];
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self).offset(25);
		make.left.equalTo(self).offset(15);
//        make.size.mas_equalTo(CGSizeMake(80, 15));
	}];
	
	[self.titileIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.titleLabel.mas_right).offset(5);
		make.size.mas_equalTo(CGSizeMake(17, 17));
		make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
	}];
	
	[self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.titleLabel);
		make.right.equalTo(self).offset(-15);
		make.size.mas_equalTo(CGSizeMake(80, 15));
	}];
	
	[self.detailTextLbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
		make.left.equalTo(self).offset(15);
	}];
}
-(void)titleIconBtnTap{
	if(self.icon_block){
		self.icon_block();
	}
}

- (UILabel *)titleLabel{
	if(!_titleLabel){
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.backgroundColor = UIColor.whiteColor;
//		_titleLabel.font = WWFONTBOLD(14);
		_titleLabel.textColor = UIColor.blackColor;
	}
	return _titleLabel;
}
- (UIButton *)titileIconBtn{
	if (!_titileIconBtn){
		_titileIconBtn = [[UIButton alloc] init];
		[_titileIconBtn addTarget:self
					   action:@selector(titleIconBtnTap)
			 forControlEvents:UIControlEventTouchUpInside];
//		[_titileIconBtn setImage:WWPNGIMAGE(@"ww_bd_aimDetail_List_queu_img") forState:UIControlStateNormal];
		_titileIconBtn.hidden = YES;
	}
	return _titileIconBtn;
}
- (UILabel *)detailTextLbl{
	if(!_detailTextLbl){
		_detailTextLbl = [[UILabel alloc]init];
		_detailTextLbl.backgroundColor = UIColor.whiteColor;
//		_detailTextLbl.font = WWFONTBOLD(11.5);
//		_detailTextLbl.textColor = WWRgbColorA(153, 153, 153, 1);
		_detailTextLbl.hidden = YES;
	}
	return _detailTextLbl;
}
- (UIButton *)selectBtn{
	if(!_selectBtn){
		_selectBtn = [[UIButton alloc]init];
		[_selectBtn addTarget:self action:@selector(selectMethod) forControlEvents:UIControlEventTouchUpInside];
		[_selectBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
//		_selectBtn.titleLabel.font = WWFONTBOLD(14);
		_selectBtn.hidden = YES;
	}
	return _selectBtn;
}
-(void)selectMethod{
	if(self.select_block){
		self.select_block();
	}
}
@end
