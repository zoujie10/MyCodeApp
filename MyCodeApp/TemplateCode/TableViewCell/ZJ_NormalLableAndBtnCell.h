//
//  ZJ_NormalLableAndBtnCell.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/2.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, Select_Btn_Type) {
	Select_Btn_Type_First, //!<
	Select_Btn_Type_Second, //!<
	Select_Btn_Type_Third,//!<
	Select_Btn_Type_Four,//!<
	Select_Btn_Type_Fifth//!<
};
NS_ASSUME_NONNULL_BEGIN
typedef void(^Click_BtnBlock)(Select_Btn_Type select_btn_type);
@interface ZJ_NormalLableAndBtnCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIButton *typeBtn;
@property (nonatomic,assign)Select_Btn_Type button_type;
@property (nonatomic,copy) Click_BtnBlock click_block;
@end

NS_ASSUME_NONNULL_END
