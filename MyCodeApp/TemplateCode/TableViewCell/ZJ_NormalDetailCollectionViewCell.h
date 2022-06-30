//
//  ZJ_NormalDetailCollectionViewCell.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJ_NormalDetailCollectionCell : UICollectionViewCell
@property (nonatomic,strong)UILabel *topLabel;
@property (nonatomic,strong)UILabel *bottomLabel;
@property (nonatomic,strong)UILabel *bottomSubLabel;
@end

@interface ZJ_NormalDetailCollectionViewCell : UITableViewCell
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)UIView *bgView;
@end

NS_ASSUME_NONNULL_END
