//
//  Watermarker.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/23.
//

#import "Watermarker.h"
//#import "SFACustomerDateConverter.h"
//#import "SFALocationManager.h"


#define DefaultCompressSize 250

#define LocalTimeGap @"LocalTimeGap"

@interface Watermarker()

@end
@implementation Watermarker

/**
 校验本地时间
 */
+ (void)checkLocalTime{
//	[_HTTPRequestMgr requestServerTimeWithSuccess:^(id  _Nonnull response) {
//
//		SFAServerTimeModel *model = [SFAServerTimeModel mj_objectWithKeyValues:response];
//
//		if (model.code == 0) {
//			[self checkLocalTimeWithServerTimeString:model.data];
//		}
//
//	} failure:^(NSError * _Nonnull error) {
//
//	}];
}

+ (void)checkLocalTimeWithServerTimeString:(NSString *)serverTimeString
{
	NSTimeInterval serverTimeInterval = [serverTimeString doubleValue]/1000;
	
	NSTimeInterval currentTimeInterval = [[NSDate date] timeIntervalSince1970];
	
	NSString  *gap = [NSString stringWithFormat:@"%f",serverTimeInterval - currentTimeInterval];
	
	[[NSUserDefaults standardUserDefaults] setObject:gap forKey:LocalTimeGap];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	
}

+ (NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image
{
	
	return [self waterImageLocationAndUserInformationWithImage:image isNeedDistance:YES];

}
+ (NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image  maxLength:(NSUInteger)maxLength
{
	
	return [self waterImageLocationAndUserInformationWithImage:image maxLength:maxLength isNeedDistance:YES];
}

+ (NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image isNeedDistance:(BOOL)isNeedDistance
{
	
	return [self waterImageLocationAndUserInformationWithImage:image maxLength:DefaultCompressSize isNeedDistance:isNeedDistance];

}
+ (NSData *)waterImageLocationAndUserInformationWithImage:(UIImage *)image  maxLength:(NSUInteger)maxLength isNeedDistance:(BOOL)isNeedDistance
{
	
	
	NSString *watermask = [self getUserInformationWatermarkWithIsNeedDistance:isNeedDistance];
	
	//添加水印后的image
	UIImage *addWatermaskImage = [self addWatermaskWithImage:image text:watermask];
	
	//压缩后的data
	return [self compressImageWithImage:addWatermaskImage maxLength:maxLength];
}

+ (UIImage *)addWatermaskWithImage:(UIImage *)image text:(NSString *)text{

	CGSize imageSize = image.size;
	
	CGFloat scale = [UIScreen mainScreen].scale;

	imageSize = CGSizeMake(imageSize.width/scale, imageSize.height/scale);
	
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;

	//1.开启上下文 这里要确认好画布的大小
	UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
	//2.绘制图片
	[image drawInRect:CGRectMake(0, 0, width, height)];

	//这里是添加文本下面的黑色区块
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextBeginPath(ctx);
	CGContextMoveToPoint(ctx, 0, height*(300-10)/370.0);
	CGContextAddLineToPoint(ctx, width, height*(300-10)/370.0);
	CGContextAddLineToPoint(ctx, width, height);

	CGContextAddLineToPoint(ctx, 0, height);
	CGPDFContextClose(ctx);
	CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor);
	CGContextFillPath(ctx);



	//添加水印文字
	NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
	paragraph.lineSpacing = 4.0;

	NSDictionary *attr = @{

						   NSFontAttributeName: [UIFont boldSystemFontOfSize:height* 74/370 * 6 / 37],

						   NSForegroundColorAttributeName : [UIColor whiteColor],
						   NSParagraphStyleAttributeName:paragraph

						   };
	[text drawInRect:CGRectMake(10/360.0*width, height*300/370.0, width-(10/360.0)*width*2, height*70/370.0) withAttributes:attr];

	UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return newImage;
}

+ (NSData *)compressImageWithImage:(UIImage *)image{
	//500kb以下不压缩
	NSUInteger maxLength = DefaultCompressSize;
	
	//NSTimeInterval time = CFAbsoluteTimeGetCurrent();
	NSData *compressData = [self compressImageWithImage:image maxLength:maxLength];
	//NSLog(@"-----ddd----%.1f", CFAbsoluteTimeGetCurrent() - time);
	
	return compressData;
}

+ (UIImage *)compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength {
	UIImage *resultImage = image;
	NSData *data = UIImageJPEGRepresentation(resultImage, 1);
	NSUInteger lastDataLength = 0;
	while (data.length > maxLength && data.length != lastDataLength) {
		lastDataLength = data.length;
		CGFloat ratio = (CGFloat)maxLength / data.length;
		CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
								 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
		UIGraphicsBeginImageContext(size);
		// Use image to draw (drawInRect:), image is larger but more compression time
		// Use result image to draw, image is smaller but less compression time
		[resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
		resultImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		data = UIImageJPEGRepresentation(resultImage, 1);
	}
	return resultImage;
}


+(NSData *)compressImageWithImage:(UIImage *)image maxLength:(NSUInteger)maxLength{
	
	if (maxLength <= 0) {
		maxLength = DefaultCompressSize;
	}
	
	maxLength = maxLength * 1024;
	
	// Compress by quality
	CGFloat compression = 0.99;
	NSData *data = UIImageJPEGRepresentation(image, compression);
	NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
	if (data.length < maxLength) return data;
	
	CGFloat max = 0.99;
	CGFloat min = 0;
	for (int i = 0; i < 6; ++i) {
		compression = (max + min) / 2;
		data = UIImageJPEGRepresentation(image, compression);
		//NSLog(@"Compression = %.1f", compression);
		//NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
		if (data.length < maxLength * 0.9) {
			min = compression;
		} else if (data.length > maxLength) {
			max = compression;
		} else {
			break;
		}
	}
	NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
	if (data.length < maxLength) return data;
	UIImage *resultImage = [UIImage imageWithData:data];
	// Compress by size
	NSUInteger lastDataLength = 0;
	while (data.length > maxLength && data.length != lastDataLength) {
		lastDataLength = data.length;
		CGFloat ratio = (CGFloat)maxLength / data.length;
		//NSLog(@"Ratio = %.1f", ratio);
		CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
								 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
		UIGraphicsBeginImageContext(size);
		[resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
		resultImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		data = UIImageJPEGRepresentation(resultImage, compression);
		//NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
	}
	NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
	return data;
}

+ (NSString *)getUserInformationWatermarkWithIsNeedDistance:(BOOL)isNeedDistance
{

	NSString *distanceString = @"";

//	if (isNeedDistance) {
//
//		NSString *originalDistanceString = [SFALocationManager distanceWithCustomerLocation];
//
//		distanceString = !IsEmptyString(originalDistanceString)? [NSString stringWithFormat:@"距客户 %@", originalDistanceString]:@"";
//	}




	NSString *dateString = [NSDate getVerifiedCurrentDateString];


	NSString *userInformaionString = [NSString stringWithFormat:@"%@\n%@ %@",dateString ,@"邹杰",@"00381342"];


	NSString *locationAndUserInformationString = [NSString stringWithFormat:@"上海市 浦东新区 塘桥街道 \n%@",userInformaionString];

//	if ([UserManager shared].province && [UserManager shared].city && [UserManager shared].district && [UserManager shared].street ) {
//		locationAndUserInformationString = [NSString stringWithFormat:@"%@%@%@%@%@\n%@",[UserManager shared].province,[UserManager shared].city,[UserManager shared].district,[UserManager shared].street,[UserManager shared].number?:@"",userInformaionString];
//	}else if ([UserManager shared].longitude && [UserManager shared].latitude)
//	{
//		locationAndUserInformationString = [NSString stringWithFormat:@"%@%@\n%@",[UserManager shared].longitude,[UserManager shared].latitude,userInformaionString];
//	}
//	else{
//		locationAndUserInformationString = [NSString stringWithFormat:@"获取不到定位\n%@",userInformaionString];
//	}

	return [NSString stringWithFormat:@"%@   %@",locationAndUserInformationString,distanceString];
}




@end

