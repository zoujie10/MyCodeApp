//
//  ZJ_NormalInpitTextFieldCell.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM (NSUInteger, Select_TextField_Type) {
	Select_TextField_Type_First, //!<
	Select_TextField_Type_Second, //!<
	Select_TextField_Type_Third,//!<
	Select_TextField_Type_Four,//!<
	Select_TextField_Type_Fifth//!<
};
typedef void(^TextInput_Done_Block)(Select_TextField_Type textField_Type,NSString * contentStr);
@interface ZJ_NormalInpitTextFieldCell : UITableViewCell
@property (nonatomic,strong)UITextView *inputTextField;
@property (nonatomic,strong)UILabel *rightLabel;
@property (nonatomic,assign)Select_TextField_Type textField_type;
@property (nonatomic,copy)TextInput_Done_Block input_done_block;
@end

NS_ASSUME_NONNULL_END
