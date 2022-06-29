//
//  NormalDetailTitleAndContentCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import "ZJ_NormalDetailTitleAndContentCell.h"

@implementation ZJ_NormalDetailTitleAndContentCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	[self.contentView addSubview:self.titleLabel];
	[self.contentView addSubview:self.valueLabel];
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView.mas_left).offset(15);
		make.top.mas_equalTo(self.contentView.mas_top).offset(12);
	}];
	
	[self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleLabel.mas_top);
		make.width.mas_equalTo(SCREEN_WIDTH/2);
		make.right.mas_equalTo(self).offset(-15);
	}];
}
#pragma mark
- (UILabel *)titleLabel{
	if(!_titleLabel){
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
		_titleLabel.textColor = WWRgbColorA(52, 52, 52, 1);
		_titleLabel.textAlignment = NSTextAlignmentLeft;
	}
	return _titleLabel;
}
- (UILabel *)valueLabel{
	if(!_valueLabel){
		_valueLabel = [[UILabel alloc]init];
		_valueLabel.font = WWFONTBOLD(14);
		_valueLabel.textColor = UIColor.blackColor;
		_valueLabel.textAlignment = NSTextAlignmentRight;
		_valueLabel.numberOfLines = 0;
		_valueLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	}
	return _valueLabel;
}
@end
