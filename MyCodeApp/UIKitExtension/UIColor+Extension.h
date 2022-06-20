//
//  UIColor+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)
/**
 *  根据hex值创建color值
 *
 *  @param hexString hex值，可以是十六进制0x，也可以是#开头
 *
 *  @return 返回颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  带透明度的hex色值
 *
 *  @param hexString hexString hex值，可以是十六进制0x，也可以是#开头
 *  @param alpha     透明度
 *
 *  @return 返回颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END
