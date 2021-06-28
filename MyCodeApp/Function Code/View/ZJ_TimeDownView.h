//
//  ZJ_TimeDownView.h
//  MyCodeApp
//
//  Created by 邹杰 on 6/28/21.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,TimeDownType) {
    TimeDownTypeText = 0,
    TimeDownTypeNumber
};
NS_ASSUME_NONNULL_BEGIN
typedef void(^TimeOverBlock)(void);
@interface ZJ_TimeDownView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                     WithType:(TimeDownType)type;
- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)width
                     WithType:(TimeDownType)type;

//设置背景色，文字颜色，圆角
- (void)setBackgroundColor:(UIColor *)backgroundColor
                 TextColor:(UIColor *)color
                    radiuo:(CGFloat)rad;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, retain) UILabel *textTimerLabel;
@property (nonatomic, copy) TimeOverBlock timeOverBlock;


- (void)setEndTime:(NSString *)endTime;
- (void)startDown:(int)timeout;


- (void)destroyTimer;

@end

NS_ASSUME_NONNULL_END
