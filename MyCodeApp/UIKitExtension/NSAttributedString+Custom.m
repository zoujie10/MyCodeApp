//
//  NSAttributedString+Custom.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/16.
//

#import "NSAttributedString+Custom.h"

@implementation NSAttributedString (Custom)
+(NSMutableAttributedString *)set_attributeText:(NSAttributedString *)attStr
										withPic:(NSString *)picName
								  withAttchRect:(CGRect)rect{
	//创建富文本
	NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithAttributedString:attStr];
	//NSTextAttachment可以将要插入的图片作为特殊字符处理
	NSTextAttachment *attch = [[NSTextAttachment alloc] init];
	//定义图片内容及位置和大小
	attch.image = [UIImage imageNamed:picName];
	attch.bounds = rect;
	//创建带有图片的富文本
	NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
	//将图片放在最后一位
	//[attri appendAttributedString:string];
	//将图片放在第一位
	[attri insertAttributedString:string atIndex:0];
	return  attri;
}
@end
