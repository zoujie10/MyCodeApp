//
//  ZJ_LeftTableViewCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/9.
//

#import "ZJ_LeftTableViewCell.h"

@implementation ZJ_LeftTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style
			  reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:style
				reuseIdentifier:reuseIdentifier];
	if (self) {
//		self.contentView.backgroundColor = [UIColor colorWithHexStringMethod:@"#F7F7F7"];
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	
	UIView *lineView = [[UIView alloc] init];
	[self.contentView addSubview:lineView];
	[lineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.contentView);
		make.top.mas_equalTo(self.contentView.mas_top).offset(10);
		make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
		make.width.mas_equalTo(3);
	}];
//	lineView.backgroundColor = [UIColor colorWithHexStringMethod:@"#FC556C"];
	lineView.hidden = YES;
	self.lineView = lineView;
	
	self.titleLabel = [[UILabel alloc]init];
	self.titleLabel.font = [UIFont systemFontOfSize:13
											 weight:UIFontWeightMedium];
	self.titleLabel.textAlignment = NSTextAlignmentCenter;
//	self.titleLabel.textColor = [UIColor colorWithHexStringMethod:@"#85868A"];
	[self.contentView addSubview:self.titleLabel];
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.lineView.mas_right).offset(8);
		make.centerY.mas_equalTo(self);
		make.right.mas_equalTo(self.contentView.mas_right);
	}];
}

@end
