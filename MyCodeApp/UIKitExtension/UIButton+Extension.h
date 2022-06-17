//
//  UIButton+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)
/** 设置可点击范围到按钮边缘的距离 */
- (void)setEnlargeEdge:(CGFloat)size;

/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

/**
 交换图片和文字位置
 */

- (void)setImageToRight;

/**
 图片文字上下结构
 @param margn 上下边距
 */
- (void)setImageToTopOf:(CGFloat)margn;
@end

NS_ASSUME_NONNULL_END
