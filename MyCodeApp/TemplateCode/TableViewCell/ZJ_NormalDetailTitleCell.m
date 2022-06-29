//
//  ZJ_NormalDetailTitleCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import "ZJ_NormalDetailTitleCell.h"
@interface ZJ_NormalDetailTitleCell()

@end
@implementation ZJ_NormalDetailTitleCell

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
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView.mas_left).offset(15);
		make.centerY.equalTo(self.contentView);
	}];
}
#pragma mark
- (UILabel *)titleLabel{
	if(!_titleLabel){
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.font = ZJFONTBOLD(14);
		_titleLabel.textColor = ZJRgbColorA(52, 52, 52, 1);
		_titleLabel.textAlignment = NSTextAlignmentLeft;
	}
	return _titleLabel;
}
@end
