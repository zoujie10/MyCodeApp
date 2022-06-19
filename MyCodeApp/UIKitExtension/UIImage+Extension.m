//
//  UIImage+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)setQRCode:(NSString *)urlStr WithSize:(CGFloat) size{
	//创建过滤器
	CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
	
	//过滤器恢复默认
	[filter setDefaults];
	
	//给过滤器添加数据
	//    NSString *string = @"http://www.baidu.com";
	NSString *string = urlStr;
	
	//将NSString格式转化成NSData格式
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	
	[filter setValue:data forKeyPath:@"inputMessage"];
	[filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
	//获取二维码过滤器生成的二维码
	CIImage *image = [filter outputImage];
	
	/**
	 *  根据CIImage生成指定大小的UIImage
	 */
	CGRect extent = CGRectIntegral(image.extent);
	CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
	
	// 1.创建bitmap;
	size_t width = CGRectGetWidth(extent) * scale;
	size_t height = CGRectGetHeight(extent) * scale;
	CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
	CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
	CIContext *context = [CIContext contextWithOptions:nil];
	CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
	CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
	CGContextScaleCTM(bitmapRef, scale, scale);
	CGContextDrawImage(bitmapRef, extent, bitmapImage);
	
	// 2.保存bitmap到图片
	CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
	UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
	CGContextRelease(bitmapRef);
	CGImageRelease(bitmapImage);
	CGColorSpaceRelease(cs);
	CGImageRelease(scaledImage);
	return newImage;
}

+(UIImage*)imageWithColor:(UIColor *)color {
	CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, color.CGColor);
	CGContextFillRect(context, rect);
	
	UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	NSData* imageData = UIImageJPEGRepresentation(image, 1.0f);
	image = [UIImage imageWithData:imageData];
	return image;
}
+ (UIImage *)setConvertUrlToImage:(NSString *)urlStr{
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
	return [UIImage imageWithData:data];
}
@end
