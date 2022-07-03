//
//  ZJ_NormalLableAndBtnCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/2.
//

#import "ZJ_NormalLableAndBtnCell.h"

@implementation ZJ_NormalLableAndBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	[self.contentView addSubview:self.typeBtn];
	[self.contentView addSubview:self.titleLabel];
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView.mas_left).offset(15);
		make.top.mas_equalTo(self.contentView.mas_top).offset(15);
		make.right.mas_equalTo(self.typeBtn.mas_left).offset(-5);
	}];
	[self.typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(self.contentView);
		make.height.mas_equalTo(@26);
		make.centerY.equalTo(self.titleLabel);
	}];
}
- (UILabel *)titleLabel{
	if(!_titleLabel){
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.font = WWFONTBOLD(15);
		_titleLabel.textColor = UIColor.blackColor;
		_titleLabel.textAlignment = NSTextAlignmentLeft;
		_titleLabel.numberOfLines = 0;
	}
	return _titleLabel;
}
- (UIButton *)typeBtn{
	if (!_typeBtn){
		_typeBtn = [[UIButton alloc] init];
		[_typeBtn addTarget:self
					 action:@selector(clickTap:)
		   forControlEvents:UIControlEventTouchUpInside];
		[_typeBtn setTitle:@"" forState:UIControlStateNormal];
		_typeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	}
	return _typeBtn;
}

- (void)setButton_type:(Select_Btn_Type)button_type{
	switch (button_type) {
		case Select_Btn_Type_First:
			
			break;
		case Select_Btn_Type_Second:
			
			break;
		case Select_Btn_Type_Third:
			
			break;
		default:
			break;
	}
	
//	[self.typeBtn setAttributedTitle:attStr forState:UIControlStateNormal];
	self.typeBtn.hidden = button_type  == Select_Btn_Type_First ? YES : NO;
}
-(void)clickTap:(UIButton *)sender{
	if (self.click_block){
		self.click_block(self.button_type);
	}
}
@end
