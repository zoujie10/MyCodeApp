//
//  UIButton+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/16.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

@implementation UIButton (Extension)
- (void)setEnlargeEdge:(CGFloat)size {
	objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
	objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
	NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
	NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
	NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
	NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
	if (topEdge && rightEdge && bottomEdge && leftEdge) {
		return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
						  self.bounds.origin.y - topEdge.floatValue,
						  self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
						  self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
	} else {
		return self.bounds;
	}
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
	CGRect rect = [self enlargedRect];
	if (CGRectEqualToRect(rect, self.bounds)) {
		return [super pointInside:point withEvent:event];
	}
	return CGRectContainsPoint(rect, point) ? YES : NO;
}

/// 交换图片和文字位置
- (void)setImageToRight{
	NSDictionary *attribute = @{NSFontAttributeName:self.titleLabel.font};
		//获取文本的宽度
	CGFloat btnWidth = [self.titleLabel.text boundingRectWithSize:CGSizeMake(0, 24)
														  options:\
						NSStringDrawingTruncatesLastVisibleLine |
						NSStringDrawingUsesLineFragmentOrigin |
						NSStringDrawingUsesFontLeading
													   attributes:attribute
														  context:nil].size.width;
	//通过调节文本和图片的内边距到达目的
	self.imageEdgeInsets = UIEdgeInsetsMake(0, btnWidth + 4, 0, -btnWidth - 4);
	[self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.image.size.width, 0, self.imageView.image.size.width)];
}
/// 图片文字上下结构
/// @param margn 上下边距
- (void)setImageToTopOf:(CGFloat)margn {
	CGFloat l_w = self.titleLabel.intrinsicContentSize.width;
	CGFloat l_h = self.titleLabel.intrinsicContentSize.height;
	CGFloat i_w = self.imageView.frame.size.width;
	CGFloat i_h = self.imageView.frame.size.height;
	UIEdgeInsets imageInsets = UIEdgeInsetsMake(-(l_h * 0.5 + margn * 0.5), l_w * 0.5, l_h * 0.5 + margn * 0.5, -l_w * 0.5);
	UIEdgeInsets labelInsets = UIEdgeInsetsMake(i_h * 0.5 + margn * 0.5, -i_w * 0.5, -i_h * 0.5 - margn * 0.5, i_w * 0.5);
	self.imageEdgeInsets = imageInsets;
	self.titleEdgeInsets = labelInsets;
}
@end
