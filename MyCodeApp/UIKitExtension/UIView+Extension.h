//
//  UIView+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGFloat originX;
@property(nonatomic) CGFloat originY;

@property(nonatomic, assign,readonly) CGSize size;
@property(nonatomic) CGFloat sizeHeight;
@property(nonatomic) CGFloat sizeWight;

@property(nonatomic, assign,readonly) CGFloat endX;
@property(nonatomic, assign,readonly) CGFloat endY;
@property(nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property(nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property(nonatomic, assign,readonly) CGFloat screenX;
@property(nonatomic, assign,readonly) CGFloat screenY;

-(void)setRadius:(CGFloat) radius;

-(void)setBorder:(CGFloat)width color:(UIColor *)color;

-(void)shakeAnimation;
@end

NS_ASSUME_NONNULL_END
