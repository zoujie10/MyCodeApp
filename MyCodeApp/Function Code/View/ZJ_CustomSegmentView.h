//
//  ZJ_CustomSegmentView.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM (NSUInteger, SelectAndSearch_SelectType) {
	SelectAndSearch_All, //!<
	SelectAndSearch_ThreeMonth, //!<
	SelectAndSearch_Search,//!<
};
typedef void(^Click_BtnType_Block)(SelectAndSearch_SelectType select_Type);

@interface ZJ_CustomSegmentView : UIView
@property(nonatomic,strong)UIButton *allBtn,*threeMonthsBtn,*searchImageBtn;
@property(nonatomic,copy)Click_BtnType_Block click_type_block;
@end

NS_ASSUME_NONNULL_END
