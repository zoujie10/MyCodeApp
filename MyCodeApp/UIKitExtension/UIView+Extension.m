//
//  UIView+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/23.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setRadius:(CGFloat) radius{
	self.layer.cornerRadius = radius;
	self.layer.masksToBounds = YES;
}

-(void)setBorder:(CGFloat)width color:(UIColor *)color{
	[self.layer setBorderColor:color.CGColor];
	[self.layer setBorderWidth:width];
}

- (CGFloat)originX{
	return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)x{
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

-(CGFloat)originY{
	return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)y{
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

-(CGFloat)sizeWight{
	return self.frame.size.width;
}

- (void)setSizeWight:(CGFloat)sizeWight{
	CGRect frame = self.frame;
	frame.size.width = sizeWight;
	self.frame = frame;
}

-(CGFloat)sizeHeight{
	return self.frame.size.height;
}

- (void)setSizeHeight:(CGFloat)sizeHeight{
	CGRect frame = self.frame;
	frame.size.height = sizeHeight;
	self.frame = frame;
}

-(CGFloat)endX{
	return [self sizeWight]+[self originX];
}

-(CGFloat)endY{
	return [self sizeHeight]+[self originY];
}

- (CGFloat)screenX{
	CGFloat x = 0;
	for (UIView* view = self; view; view = view.superview) {
		x += view.originX;
	}
	return x;
}

- (CGFloat)screenY{
	CGFloat y = 0;
	for (UIView* view = self; view; view = view.superview) {
		y += view.originY;
	}
	return y;
}

- (CGPoint)origin{
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin{
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGFloat)centerX{
	return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
	self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY{
	return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
	self.center = CGPointMake(self.center.x, centerY);
}

- (CGSize)size{
	return self.frame.size;
}

- (void)setSize:(CGSize)size{
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}
-(void)shakeAnimation{
	CAKeyframeAnimation * popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	popAnimation.duration = 0.35;
	popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
							[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.00f, 1.00f, 1.0f)],
							[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
							[NSValue valueWithCATransform3D:CATransform3DIdentity]];
	popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @0.8f];
	popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
									 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
									 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[self.layer addAnimation:popAnimation forKey:nil];
}
@end
