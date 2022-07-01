//
//  UITextView+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/1.
//

#import "UITextView+Extension.h"
#import <objc/runtime.h>

@interface UITextView ()
@property (nonatomic, strong) UILabel *placeHolderLabel;
@end
@implementation UITextView (Extension)
-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
	if(!self.placeHolderLabel){
		UILabel *placeHolderLabel = [[UILabel alloc] init];
		placeHolderLabel.numberOfLines = 0;
		placeHolderLabel.font = self.font;
		[placeHolderLabel sizeToFit];
		[self addSubview:placeHolderLabel];
		self.placeHolderLabel = placeHolderLabel;
		/*
		 [self setValue:(nullable id) forKey:(nonnull NSString *)]
		 ps: KVC键值编码，对UITextView的私有属性进行修改
		 */
		[self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
	}
	self.placeHolderLabel.text = placeholdStr;
	self.placeHolderLabel.textColor = placeholdColor;
}

-(void)setPlaceHolderLabel:(UILabel *)placeHolderLabel{
	objc_setAssociatedObject(self,
							 @selector(placeHolderLabel),
							 placeHolderLabel,
							 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)placeHolderLabel{
	return objc_getAssociatedObject(self, @selector(placeHolderLabel));
}
@end
