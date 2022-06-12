//
//  ZJ_CodeBlockViewController.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ZJ_ENUM_EG) {
	ZJ_ENUM_EG_One = 1,
	ZJ_ENUM_EG_Two,
	ZJ_ENUM_EG_Three,
	ZJ_ENUM_EG_Four
};
@interface ZJ_CodeBlockViewController : UIViewController
@property (nonatomic,assign)ZJ_ENUM_EG eg_enum;
@end

NS_ASSUME_NONNULL_END
