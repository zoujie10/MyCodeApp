//
//  ZJ_NormalDetailCollectionViewCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import "ZJ_NormalDetailCollectionViewCell.h"

//Collection Item
@interface ZJ_NormalDetailCollectionCell()

@end
@implementation ZJ_NormalDetailCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
//		self.backgroundColor = WWRgbColor(250, 250, 250);
//		[self setRadius:6];
	
		self.clipsToBounds = YES;
		[self configIU];
	}
	return self;
}

-(void)configIU{
	[self.contentView addSubview:self.topLabel];
	[self.contentView addSubview:self.bottomLabel];
	[self.contentView addSubview:self.bottomSubLabel];
	[self.contentView addSubview:self.picImageView];
	
	[self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView).offset(36);
		make.top.mas_equalTo(self.contentView).offset(20);
	}];
	
	[self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.topLabel);
		make.top.mas_equalTo(self.topLabel.mas_bottom).offset(15);
	}];
	
	[self.bottomSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.bottomLabel.mas_right).offset(8);
		make.baseline.mas_equalTo(self.bottomLabel.mas_baseline);
	}];
	
	[self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.contentView);
	}];
}
- (UILabel *)topLabel{
	if(!_topLabel){
		_topLabel = [[UILabel alloc]init];
		_topLabel.textAlignment = NSTextAlignmentLeft;
		_topLabel.backgroundColor = UIColor.clearColor;
//		_topLabel.textColor = WWRgbColor(102, 102, 102);
		_topLabel.text = @"";
		_topLabel.lineBreakMode = NSLineBreakByWordWrapping;
//		_topLabel.font = WWFONTBOLD(12);
	}
	return _topLabel;
}
- (UILabel *)bottomLabel{
	if(!_bottomLabel){
		_bottomLabel = [[UILabel alloc]init];
		_bottomLabel.textAlignment = NSTextAlignmentLeft;
		_bottomLabel.backgroundColor = UIColor.clearColor;
//		_bottomLabel.textColor = WWRgbColorA(252, 85, 108, 1);///WWRgbColorA(252, 85, 108, 1);
		_bottomLabel.text = @"";
		_bottomLabel.lineBreakMode = NSLineBreakByWordWrapping;
//		_bottomLabel.font = WWFONTBOLD(19);
	}
	return _bottomLabel;
}
- (UILabel *)bottomSubLabel{
	if(!_bottomSubLabel){
		_bottomSubLabel = [[UILabel alloc]init];
		_bottomSubLabel.textAlignment = NSTextAlignmentLeft;
		_bottomSubLabel.backgroundColor = UIColor.clearColor;
//		_bottomSubLabel.textColor = WWRgbColorA(252, 85, 108, 1);
		_bottomSubLabel.text = @"";
		_bottomSubLabel.lineBreakMode = NSLineBreakByWordWrapping;
//		_bottomSubLabel.font = WWFONTBOLD(12);
	}
	return _bottomSubLabel;
}
- (UIImageView *)picImageView{
	if(!_picImageView){
		_picImageView = [[UIImageView alloc] init];
		_picImageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
		_picImageView.contentMode = UIViewContentModeScaleAspectFill;
		_picImageView.userInteractionEnabled = YES;
	}
	return _picImageView;
}
@end



@interface ZJ_NormalDetailCollectionViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;

@end
@implementation ZJ_NormalDetailCollectionViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.backgroundColor = UIColor.whiteColor;
	   
		[self configContentView];
	}
	return self;
}
-(void)configContentView{
	self.bgView = [[UIView alloc]init];
	self.bgView.backgroundColor = UIColor.whiteColor;
	self.bgView.layer.cornerRadius = 8;
	[self.contentView addSubview:self.bgView];
	
	[self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
	}];
	
	[self.bgView addSubview:self.collectionView];
	[self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(self.bgView).offset(10);
		make.left.equalTo(self.bgView).offset(10);
		make.right.equalTo(self.bgView).offset(-10);
		make.bottom.mas_equalTo(self.bgView).offset(-10);
	}];
}
- (void)setDataArray:(NSArray *)dataArray{
	_dataArray = dataArray;
	
	[self.collectionView reloadData];
}
#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	if (self.dataArray.count > 0) {
		return self.dataArray.count;
	}
	return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	ZJ_NormalDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZJ_NormalDetailCollectionCell" forIndexPath:indexPath];
	if (self.dataArray.count > 0){
		cell.topLabel.text = [NSString stringWithFormat:@"第%ld个月",indexPath.item+1];
//		cell.bottomLabel.textColor = WWRgbColorA(52, 52, 52, 1);
		NSNumber *priceUnit = self.dataArray[indexPath.item];
		NSAttributedString * subPrice;
		if(priceUnit.floatValue >= 30000 && priceUnit.floatValue < 50000){
			cell.bottomSubLabel.hidden = NO;
//			cell.bottomLabel.textColor = WWRgbColorA(252, 85, 108, 1);
//			subPrice = [[NSAttributedString alloc]initWithString:@" 3万" attributes:@{NSForegroundColorAttributeName:WWRgbColorA(252, 85, 108, 1)}];
			
		}else if (50000 <= priceUnit.floatValue){
			cell.bottomSubLabel.hidden = NO;
//			cell.bottomLabel.textColor = WWRgbColorA(252, 85, 108, 1);
//			subPrice = [[NSAttributedString alloc]initWithString:@" 5万" attributes:@{NSForegroundColorAttributeName:WWRgbColorA(252, 85, 108, 1)}];
			
		}else{
			cell.bottomSubLabel.hidden = YES;
		}
//		NSMutableAttributedString *attStr = [NSMutableAttributedString set_attributeText:subPrice withPic:@"ww_bd_mine_recommend_info_cell_price_up_arrow_icon" withAttchRect:CGRectMake(0, -3, 15, 15)];
//		cell.bottomSubLabel.attributedText = attStr;
//
//		cell.bottomLabel.attributedText =  [NSString stringUnitShift:priceUnit.floatValue isHaveTag:YES UnitSize:18];
	}
	return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
	return CGSizeMake((collectionView.frame.size.width-10)/2, 85);
}

#pragma  mark lazy load
- (UICollectionView *)collectionView{
	if (!_collectionView){
		
		UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.itemSize = CGSizeMake(70*kScaleW6, 70*kScaleW6);
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
		_collectionView.alwaysBounceVertical = YES;
		
		_collectionView.backgroundColor = UIColor.whiteColor;
		_collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
		_collectionView.dataSource = self;
		_collectionView.delegate = self;
		_collectionView.scrollEnabled = NO;
		_collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
		[_collectionView registerClass:[ZJ_NormalDetailCollectionCell class] forCellWithReuseIdentifier:@"ZJ_NormalDetailCollectionCell"];
		_collectionView.layer.cornerRadius = 4;
	}
	return _collectionView;
}
@end
