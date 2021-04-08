//
//  ZJ_CodeBlockVC.h
//  MyCodeApp
//
//  Created by 邹杰 on 4/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ZJ_ENUM_EG) {
    ZJ_ENUM_EG_One = 1,
    ZJ_ENUM_EG_Two,
    ZJ_ENUM_EG_Three,
    ZJ_ENUM_EG_Four
};

typedef void (^BlockName)(CGSize Size,NSString *str);
@interface ZJ_CodeBlockVC : UIViewController

@property (nonatomic , copy) BlockName blockEG;

@end

NS_ASSUME_NONNULL_END
