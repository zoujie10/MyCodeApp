//
//  Watermarker.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Watermarker : NSObject
/**
 指定水印 地址\n时间\n用户名账号
 */
+(NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image;

+(NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image isNeedDistance:(BOOL)isNeedDistance;

+(NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image  maxLength:(NSUInteger)maxLength;

+(UIImage *)compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength;

+(NSData *)compressImageWithImage:(UIImage *)image;

+(NSData *)compressImageWithImage:(UIImage *)image maxLength:(NSUInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
