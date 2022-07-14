//
//  ZJ_TipMessageView.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/14.
//

#import "ZJ_TipMessageView.h"

@implementation ZJ_TipMessageView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = ZJRgbColor(255, 251, 216);
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	[self addSubview:self.click_Btn];
	[self addSubview:self.contentLabel];
	
	[self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.mas_equalTo(self);
		make.left.mas_equalTo(self).offset(10);
		make.right.mas_equalTo(self).offset(-10);
	}];
	
	[self.click_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.mas_equalTo(self.contentLabel);
		make.right.mas_equalTo(self.mas_right).offset(-10);
	}];
}

- (UILabel *)contentLabel{
	if (!_contentLabel) {
		_contentLabel = [[UILabel alloc] init];
		_contentLabel.textColor = ZJRgbColor(252, 126, 57);
		_contentLabel.backgroundColor = [UIColor clearColor];
		_contentLabel.textAlignment = NSTextAlignmentCenter;
		_contentLabel.font = [UIFont boldSystemFontOfSize:12];
		_contentLabel.layer.masksToBounds = YES;
		_contentLabel.numberOfLines = 0;
		_contentLabel.text = @"如您需要退货 请联系客服";
	}
	return _contentLabel;
}
- (UIButton *)click_Btn{
	if (!_click_Btn) {
		_click_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[_click_Btn setTitle:@"联系客服" forState:UIControlStateNormal];
		[_click_Btn setImage:[UIImage imageNamed:@"zj_button_right_arrow"] forState:UIControlStateNormal];
		[_click_Btn setBackgroundColor:[UIColor clearColor]];
		[_click_Btn setTitleColor:ZJRgbColor(252, 126, 57) forState:UIControlStateNormal];
		_click_Btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
		[_click_Btn addTarget:self action:@selector(alterButtonSelector:) forControlEvents:UIControlEventTouchUpInside];
		[_click_Btn setImageToRight];
	}
	return _click_Btn;
}
-(void)alterButtonSelector:(UIButton *)sender{
	if(self.click_block){
		self.click_block();
	}
}

@end
