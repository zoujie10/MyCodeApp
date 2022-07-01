//
//  ZJ_NormalDetailTitleAndTextViewCell.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Textview_ReturnBlock)(NSString *text);
@interface ZJ_NormalDetailTitleAndTextViewCell : UITableViewCell
@property (nonatomic , strong) UITextView *contentTextView;
@property (nonatomic , strong) UILabel *memoTextCountLabel;
@property (nonatomic , strong) UILabel *topLabel;
@property (nonatomic , strong) UIView *bgView;
@property (nonatomic,copy)Textview_ReturnBlock textView_block;
@end

NS_ASSUME_NONNULL_END
