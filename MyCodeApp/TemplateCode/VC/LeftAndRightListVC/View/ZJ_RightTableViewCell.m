//
//  ZJ_RightTableViewCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/9.
//

#import "ZJ_RightTableViewCell.h"
@interface ZJ_RightTableViewCell()
@property (nonatomic, strong)UILabel *saleOutLabel;
@end
@implementation ZJ_RightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
			  reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style
				reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle =  UITableViewCellSelectionStyleNone;
		self.backgroundColor = [UIColor whiteColor];
		[self creatUI];
	}
	return self;
}

-(void)creatUI{
	[self.contentView addSubview:self.goodsImageVIew];
	[self.contentView addSubview:self.titleLabel];
	[self.contentView addSubview:self.speclabel];
	[self.contentView addSubview:self.saleCountLabel];
	[self.contentView addSubview:self.priceLabel];
	[self.contentView addSubview:self.buyCartBtn];
	[self.goodsImageVIew addSubview:self.saleOutBackView];
	[self.saleOutBackView addSubview:self.saleOutLabel];
	
	UIView *bottomLine = [[UIView alloc]init];
	bottomLine.backgroundColor = [UIColor colorWithWhite:0 alpha:0.05];
	[self.contentView addSubview:bottomLine];
	
	[_goodsImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView).offset(6);
		make.width.height.mas_equalTo(64);
		make.left.equalTo(self.contentView).offset(12);
	}];
	
	[_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.contentView).offset(6);
		make.left.equalTo(self.goodsImageVIew.mas_right).offset(10);
		make.width.mas_equalTo(SCREEN_WIDTH - (86+64+20+10+10));
	}];
	
	[_speclabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.titleLabel.mas_baseline).offset(7);
		make.left.equalTo(self.titleLabel);
		make.right.equalTo(self.titleLabel).offset(-15);
	}];
	
	[_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.mas_equalTo(bottomLine.mas_top).mas_offset(-6);
		make.left.equalTo(self.titleLabel);
	}];

	
	[_saleCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		   make.baseline.equalTo(self.priceLabel);
		   make.left.equalTo(self.priceLabel.mas_right).offset(4);
	}];
	
	[_buyCartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.priceLabel);
		make.width.height.mas_equalTo(35);
		make.right.equalTo(self.contentView).offset(-10);
	}];
	
	//标记
	[_saleOutBackView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.goodsImageVIew);
	}];
	
	[_saleOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.centerY.equalTo(self.saleOutBackView);
		make.height.mas_equalTo(20);
	}];
	
	[bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
		make.left.mas_equalTo(self.goodsImageVIew.mas_left).offset(12);
		make.right.mas_equalTo(self.buyCartBtn.mas_right).offset(-15);
		make.height.mas_equalTo(@0.67);
	}];
	self.saleCountLabel.hidden = true;
	
}

- (UIImageView *)goodsImageVIew{
	if(!_goodsImageVIew){
		_goodsImageVIew = [[UIImageView alloc] init];
		_goodsImageVIew.layer.cornerRadius = 4;
		_goodsImageVIew.layer.masksToBounds = YES;
		_goodsImageVIew.contentMode = UIViewContentModeScaleAspectFit;
	}
	return _goodsImageVIew;
}

- (UILabel *)titleLabel{
	if(!_titleLabel){
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.font = [UIFont systemFontOfSize:14
											 weight:UIFontWeightMedium];
		_titleLabel.textAlignment = NSTextAlignmentLeft;
		_titleLabel.textColor = [UIColor colorWithRed:22/255.0
												green:25/255.0
												 blue:30/255.0
												alpha:1.0];
		_titleLabel.numberOfLines = 2;
	}
	return _titleLabel;
}

- (UILabel *)speclabel{
	if(!_speclabel){
		_speclabel = [[UILabel alloc]init];
		_speclabel.font = [UIFont boldSystemFontOfSize:11];
		_speclabel.textAlignment = NSTextAlignmentLeft;
		_speclabel.textColor = [UIColor colorWithRed:138/255.0
											   green:143/255.0
												blue:150/255.0
											   alpha:1.0];
	}
	return _speclabel;
}

- (UILabel *)saleCountLabel{
	if(!_saleCountLabel){
		_saleCountLabel = [[UILabel alloc] init];
		_saleCountLabel.font = [UIFont systemFontOfSize:10
												 weight:UIFontWeightMedium];
		_saleCountLabel.textAlignment = NSTextAlignmentLeft;
		_saleCountLabel.textColor = [UIColor colorWithRed:138/255.0
													green:143/255.0
													 blue:150/255.0
													alpha:1.0];
	}
	return _saleCountLabel;
}

- (UILabel *)priceLabel{
	if(!_priceLabel){
		_priceLabel = [[UILabel alloc]init];
		_priceLabel.textAlignment = NSTextAlignmentLeft;
		_priceLabel.textColor = [UIColor colorWithRed:252/255.0
												green:85/255.0
												 blue:108/255.0
												alpha:1.0];
	}
	return _priceLabel;
}

////标注
- (UIView *)saleOutBackView {
	if (!_saleOutBackView) {
		_saleOutBackView = [[UIView alloc] init];
//		_saleOutBackView.backgroundColor = WWRgbColorA(255, 255, 255, 0.6);
		_saleOutBackView.hidden = YES;
	}
	return _saleOutBackView;
}

- (UILabel *)saleOutLabel {
	if (!_saleOutLabel) {
		_saleOutLabel = [[UILabel alloc] init];
		_saleOutLabel.layer.cornerRadius = 4.0;
		_saleOutLabel.clipsToBounds = YES;
		_saleOutLabel.text = @"补货中";
		_saleOutLabel.font = [UIFont boldSystemFontOfSize:12];
		_saleOutLabel.textAlignment = NSTextAlignmentCenter;
		_saleOutLabel.textColor = [UIColor whiteColor];
//		_saleOutLabel.backgroundColor = WWRgbColorA(0, 0, 0, 0.6);
	}
	return _saleOutLabel;
}

- (UIButton *)buyCartBtn{
	if(!_buyCartBtn){
		_buyCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		
		[_buyCartBtn addTarget:self
						action:@selector(clickBuyButton:)
			  forControlEvents:UIControlEventTouchUpInside];
//		[_buyCartBtn setImage:WWPNGIMAGE(@"ww_homes_cell_add_cart_btn_white_img")
//					 forState:UIControlStateNormal];
//		[_buyCartBtn setImage:WWPNGIMAGE(@"ww_homes_cell_add_cart_btn_white_img")
//					 forState:UIControlStateHighlighted];
	}
	return _buyCartBtn;
}

-(void)clickBuyButton:(UIButton *)sender{
	if(self.clickBuy){
		self.clickBuy(self.goodsImageVIew);
	}
}

@end
