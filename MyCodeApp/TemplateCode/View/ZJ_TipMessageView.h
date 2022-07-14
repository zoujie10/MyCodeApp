//
//  ZJ_TipMessageView.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Click_Button_Blcok)(void);

@interface ZJ_TipMessageView : UIView
@property (nonatomic , strong)UILabel *contentLabel;
@property (nonatomic , strong)UIButton *click_Btn;
@property (nonatomic , copy) Click_Button_Blcok click_block;
@end

NS_ASSUME_NONNULL_END
