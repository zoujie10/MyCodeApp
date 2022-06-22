//
//  NSMutableAttributedString+Custom.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Custom)
+(NSMutableAttributedString *)set_attributeIntactString:(NSString *)intactStr
										 IntactStrRBGColor:(UIColor *)intactStrColor
										  IntactStrFont:(CGFloat)intactStrFont
											andalterStr:(NSString *)alterStr
											RBGColorStr:(UIColor *)colorStr
												FontStr:(CGFloat)fontStr;
/**
	富文本加 + icon 图片
*/
+(NSMutableAttributedString *)set_attributeText:(NSAttributedString *)attStr
										withPic:(NSString *)picName
										withAttchRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
