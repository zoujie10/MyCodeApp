//
//  UITextField+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extension)
/// 判断TextField输入是否包含表情符号
-(BOOL)judgeTextContentIsContainEmoji;
@end

NS_ASSUME_NONNULL_END
