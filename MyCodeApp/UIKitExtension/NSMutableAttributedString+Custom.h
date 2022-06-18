//
//  NSMutableAttributedString+Custom.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Custom)
/**
	富文本加 + icon 图片
*/
+(NSMutableAttributedString *)set_attributeText:(NSAttributedString *)attStr
										withPic:(NSString *)picName
										withAttchRect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
