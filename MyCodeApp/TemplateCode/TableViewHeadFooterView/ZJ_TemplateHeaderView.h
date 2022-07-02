//
//  ZJ_TemplateHeaderView.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Select_Block)(void);
typedef void(^Icon_Btn_Block)(void);
@interface ZJ_TemplateHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)UILabel *titleLabel,*detailTextLbl;
@property(nonatomic,strong)UIButton *titileIconBtn,*selectBtn;
@property(nonatomic,strong)UIView *bgView,*line;
@property(nonatomic,copy)Select_Block select_block;
@property(nonatomic,copy)Icon_Btn_Block icon_block;
@end

NS_ASSUME_NONNULL_END
