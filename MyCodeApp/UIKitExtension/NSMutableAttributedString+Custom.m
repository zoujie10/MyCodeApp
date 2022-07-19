//
//  NSMutableAttributedString+Custom.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import "NSMutableAttributedString+Custom.h"

@implementation NSMutableAttributedString (Custom)
+(NSMutableAttributedString *)set_attributeIntactString:(NSString *)intactStr
										 IntactStrRBGColor:(UIColor *)intactStrColor
										  IntactStrFont:(CGFloat)intactStrFont
											andalterStr:(NSString *)alterStr
											RBGColorStr:(UIColor *)colorStr
												FontStr:(CGFloat)fontStr{
	
	NSMutableAttributedString *attring = [[NSMutableAttributedString alloc] initWithString:
										  [NSString stringWithFormat:@"%@",intactStr]
																				attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:intactStrFont],NSForegroundColorAttributeName: intactStrColor}];
	NSRange range = [intactStr rangeOfString:alterStr];
	[attring addAttribute:NSForegroundColorAttributeName value:colorStr range:range];
	[attring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontStr] range:range];
	return attring;
}

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
/**
	富文本加 + icon 图片
*/
+(NSMutableAttributedString *)set_attributeText:(NSAttributedString *)attStr
										withPic:(NSString *)picName
										withAttchRect:(CGRect)rect
								  isLeftOrRight:(BOOL)isLeftOrRight{
	//创建富文本
	NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithAttributedString:attStr];
	//NSTextAttachment可以将要插入的图片作为特殊字符处理
	NSTextAttachment *attch = [[NSTextAttachment alloc] init];
	//定义图片内容及位置和大小
	attch.image = [UIImage imageNamed:picName];
	attch.bounds = rect;
	//创建带有图片的富文本
	NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
	
	if(isLeftOrRight){
		//将图片放在第一位
		[attri insertAttributedString:string atIndex:0];
	}else{
		//将图片放在最后一位
		[attri appendAttributedString:string];
	}
	return  attri;
}
@end
