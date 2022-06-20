//
//  UIColor+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/19.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+ (UIColor *)colorWithHexString:(NSString *)hexString {

	return [UIColor colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
   
	//删除字符串中的空格（stringByTrimmingCharactersInSet用于）
	NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	//过滤后的字符串若不足6位则返回透明颜色
	if ([cString length] < 6) {
		return [UIColor clearColor];
	}
	
	//若是0X或者0x开头的，那么截取的字符串从索引位2开始至末尾
	if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
		cString = [cString substringFromIndex:2];
	}
	//若是#开头的，那么截取的字符串从索引位1开始至末尾
	if ([cString hasPrefix:@"#"]) {
		cString = [cString substringFromIndex:1];
	}
	
	//若截取后的字符串不足6位或超出6位，按错误处理，统一返回透明色值
	if ([cString length] != 6) {
		return [UIColor clearColor];
	}
	
	//其他的返回RGB色值颜色
	NSRange range;
	range.location = 0;
	range.length = 2;
	//red
	NSString *redString = [cString substringWithRange:range];
	//green
	range.location = 2;
	NSString *greenString = [cString substringWithRange:range];
	//blue
	range.location = 4;
	NSString *blueString = [cString substringWithRange:range];
	
	//扫描组合颜色
	unsigned red,green,blue;
	[[NSScanner scannerWithString:redString] scanHexInt:&red];
	[[NSScanner scannerWithString:greenString] scanHexInt:&green];
	[[NSScanner scannerWithString:blueString] scanHexInt:&blue];
	
	return [UIColor colorWithRed:((float)red/255.0)
						   green:((float)green/255.0)
							blue:((float)blue/255.0)
						   alpha:alpha];
}
+(CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length{
	NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
	NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
	unsigned hexComponent;
	[[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
	return hexComponent / 255.0;
}
@end
