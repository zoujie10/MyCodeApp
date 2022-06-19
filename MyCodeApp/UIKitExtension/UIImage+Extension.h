//
//  UIImage+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)
//二维码图片
+(UIImage *)setQRCode:(NSString *)urlStr WithSize:(CGFloat) size;

//由颜色生成图片
+(UIImage *)imageWithColor:(UIColor*)color;

//图片地址 转 图片对象
+(UIImage *)setConvertUrlToImage:(NSString *)urlStr;
@end

NS_ASSUME_NONNULL_END
