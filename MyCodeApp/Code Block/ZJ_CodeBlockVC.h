//
//  ZJ_CodeBlockVC.h
//  MyCodeApp
//
//  Created by 邹杰 on 4/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^BlockName)(CGSize Size,NSString *str);
@interface ZJ_CodeBlockVC : UIViewController

@property (nonatomic , copy) BlockName blockEG;

@end

NS_ASSUME_NONNULL_END
