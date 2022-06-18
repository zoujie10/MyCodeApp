//
//  ZJUILabel.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/8/21.
//

#import "ZJUILabel.h"

@interface ZJUILabel()
@property(nonatomic, strong) UIColor *originalBackgroundColor;
@property(nonatomic, strong) UILongPressGestureRecognizer *longGestureRecognizer;
@property(nonatomic, strong) UIMenuController *menuController;
@end
@implementation ZJUILabel

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {
    _contentEdgeInsets = contentEdgeInsets;
    [self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:CGSizeMake(size.width - UIEdgeInsetsGetHorizontalValue(self.contentEdgeInsets), size.height - UIEdgeInsetsGetVerticalValue(self.contentEdgeInsets))];
    size.width += UIEdgeInsetsGetHorizontalValue(self.contentEdgeInsets);
    size.height += UIEdgeInsetsGetVerticalValue(self.contentEdgeInsets);
    return size;
}

- (CGSize)intrinsicContentSize {
    CGFloat preferredMaxLayoutWidth = self.preferredMaxLayoutWidth;
    if (preferredMaxLayoutWidth <= 0) {
        preferredMaxLayoutWidth = CGFLOAT_MAX;
    }
    return [self sizeThatFits:CGSizeMake(preferredMaxLayoutWidth, CGFLOAT_MAX)];
}

- (void)drawTextInRect:(CGRect)rect {
    rect = UIEdgeInsetsInsetRect(rect, self.contentEdgeInsets);
    
    // 在某些情况下文字位置错误，因此做了如下保护
    // https://github.com/Tencent/QMUI_iOS/issues/529
    if (self.numberOfLines == 1 && (self.lineBreakMode == NSLineBreakByWordWrapping || self.lineBreakMode == NSLineBreakByCharWrapping)) {
        rect = CGRectSetHeight(rect, CGRectGetHeight(rect) + self.contentEdgeInsets.top * 2);
    }
    
    [super drawTextInRect:rect];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (self.highlightedBackgroundColor) {
        [super setBackgroundColor:highlighted ? self.highlightedBackgroundColor : self.originalBackgroundColor];
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.originalBackgroundColor = backgroundColor;
    
    // 在出现 menu 的时候 backgroundColor 被修改，此时也不应该立马显示新的 backgroundColor
    if (self.highlighted && self.highlightedBackgroundColor) {
        return;
    }
    
    [super setBackgroundColor:backgroundColor];
}

// 当 label.highlighted = YES 时 backgroundColor 的 getter 会返回 self.highlightedBackgroundColor，因此如果在 highlighted = YES 时外部刚好执行了 `label.backgroundColor = label.backgroundColor` 就会导致 label 的背景色被错误地设置为高亮时的背景色，所以这里需要重写 getter 返回内部记录的 originalBackgroundColor
- (UIColor *)backgroundColor {
    return self.originalBackgroundColor;
}

#pragma mark - 长按复制功能

- (void)setCanPerformCopyAction:(BOOL)canPerformCopyAction {
    _canPerformCopyAction = canPerformCopyAction;
    if (_canPerformCopyAction && !self.longGestureRecognizer) {
        self.userInteractionEnabled = YES;
        self.longGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestureRecognizer:)];
        [self addGestureRecognizer:self.longGestureRecognizer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMenuWillHideNotification:) name:UIMenuControllerWillHideMenuNotification object:nil];
    } else if (!_canPerformCopyAction && self.longGestureRecognizer) {
        [self removeGestureRecognizer:self.longGestureRecognizer];
        self.longGestureRecognizer = nil;
        self.userInteractionEnabled = NO;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (BOOL)canBecomeFirstResponder {
    return self.canPerformCopyAction;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if ([self canBecomeFirstResponder]) {
        return action == @selector(copyString:);
    }
    return NO;
}

- (void)copyString:(id)sender {
    if (self.canPerformCopyAction) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *stringToCopy = self.text;
        if (stringToCopy) {
            pasteboard.string = stringToCopy;
            [self.menuController hideMenu];
            if (self.didCopyBlock) {
                self.didCopyBlock(self, stringToCopy);
            }
        }
    }
}

- (void)handleLongPressGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.canPerformCopyAction) {
        return;
    }
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        self.menuController = [UIMenuController sharedMenuController];
        UIMenuItem *copyMenuItem = [[UIMenuItem alloc] initWithTitle:self.menuItemTitleForCopyAction ?: @"复制" action:@selector(copyString:)];
        [[UIMenuController sharedMenuController] setMenuItems:@[copyMenuItem]];
//        [menuController setTargetRect:self.frame inView:self.superview];//deprecated ios 13.0
        [self.menuController showMenuFromView:self.superview rect:self.frame];
//        [menuController setMenuVisible:YES animated:YES];//deprecated ios 13.0

        self.highlighted = YES;
    } else if (gestureRecognizer.state == UIGestureRecognizerStatePossible) {
        self.highlighted = NO;
    }
}

- (void)handleMenuWillHideNotification:(NSNotification *)notification {
    if (!self.canPerformCopyAction) {
        return;
    }
    
    [self setHighlighted:NO];
}

- (ZJUILabel *(^)(CGFloat r,
				CGFloat g,
				CGFloat b,
				CGFloat a))setUpTextColorRGBA {
	return ^(CGFloat r,
			 CGFloat g,
			 CGFloat b,
			 CGFloat a) {
		
		r /= 255.0;
		g /= 255.0;
		b /= 255.0;
		
		UIColor *color = [UIColor colorWithRed:r
										 green:g
										  blue:b
										 alpha:a];
		return self.setUpTextColor(color);
	};
	
}
- (ZJUILabel *(^)(CGFloat r,
				CGFloat g,
				CGFloat b))setUpTextColorRGB {
	return ^(CGFloat r,
			 CGFloat g,
			 CGFloat b) {
		return self.setUpTextColorRGBA(r,g,b,1);
	};
}

- (ZJUILabel *(^)(UIColor *color))setUpTextColor {
	return ^(UIColor *color) {
		self.textColor = color;
		return self;
	};
}

- (ZJUILabel *(^)(UIFont *font))fontSetUp {
	return ^ (UIFont *font) {
		self.font = font;
		return self;
	};
}
- (ZJUILabel *(^)(NSString *contentStr,NSString *iconName,CGRect iconRect))setAttTextIcon{
	return ^ (NSString *contentStr,NSString *iconName,CGRect iconRect){
		if(contentStr.length < 1) contentStr = @" ";
		//创建富文本
		NSAttributedString *str = [[NSAttributedString alloc]initWithString:contentStr];
		NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithAttributedString:str];
		//NSTextAttachment可以将要插入的图片作为特殊字符处理
		NSTextAttachment *attch = [[NSTextAttachment alloc] init];
		//定义图片内容及位置和大小
		attch.image = [UIImage imageNamed:iconName];
		attch.bounds = iconRect;
		//创建带有图片的富文本
		NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
		//将图片放在最后一位
		//[attri appendAttributedString:string];
		//将图片放在第一位
		[attri insertAttributedString:string atIndex:0];
		self.attributedText = attri;
		return self;
	};
}

@end
