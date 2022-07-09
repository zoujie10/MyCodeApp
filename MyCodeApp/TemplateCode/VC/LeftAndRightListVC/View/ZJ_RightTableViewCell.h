//
//  ZJ_RightTableViewCell.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^clickBuyCartButton)(UIView * _Nullable currentView);
@interface ZJ_RightTableViewCell : UITableViewCell
/// 商品图片
@property (nonatomic, strong) UIImageView *goodsImageVIew;
/// 商品名称
@property (nonatomic, strong)UILabel *titleLabel;
/// 商品规格
@property (nonatomic, strong)UILabel *speclabel;
/// 商品已售数量
@property (nonatomic, strong) UILabel *saleCountLabel;
/// 商品售价
@property (nonatomic, strong) UILabel *priceLabel;
/// 补货中蒙板
@property (nonatomic, strong) UIView *saleOutBackView;

@property (nonatomic, strong) UIButton *buyCartBtn;
/// 购买按钮点击回调
@property (nonatomic, copy) clickBuyCartButton clickBuy;
@end

NS_ASSUME_NONNULL_END
