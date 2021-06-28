//
//  ZJ_TimeDownView.m
//  MyCodeApp
//
//  Created by 邹杰 on 6/28/21.
//

#import "ZJ_TimeDownView.h"
#define TimeLabelFont  [UIFont systemFontOfSize:13]
static CGFloat  TimeLabelW = 25.f;
static CGFloat const JIANJU = 10.f;


@interface ZJ_TimeDownView() {
    dispatch_source_t _timer;
    CGFloat _timeLabelW;
    CGFloat _timeLabelH;
}
@property (nonatomic, retain) UILabel *hourLabel;
@property (nonatomic, retain) UILabel *minuteLabel;
@property (nonatomic, retain) UILabel *secondLabel;
@property (nonatomic, retain) UILabel *otherLabel;
@property (nonatomic, retain) UILabel *otherLabel1;
@property (nonatomic, retain) UIView *bgView;
@property (nonatomic, assign) TimeDownType timeDownType;
@end

@implementation ZJ_TimeDownView

- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)width WithType:(TimeDownType)type {
    TimeLabelW = width;
    return [self initWithFrame:frame WithType:type];
}

- (instancetype)initWithFrame:(CGRect)frame WithType:(TimeDownType)type {
    self = [super initWithFrame:frame];
    if (self) {
        _timeDownType = type;
        [self setupTimeDownUI:type];
        
    }
    return self;
}
#pragma mark - 初始化视图
- (void)setupTimeDownUI:(TimeDownType)type {
    self.backgroundColor = [UIColor clearColor];
    
    /****************************************数字倒计时****************************************/
    if (type == TimeDownTypeNumber) {
        CGFloat labelX = (self.bounds.size.width - 3 * TimeLabelW - 2 *JIANJU) / 2;
        UILabel *hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 0, TimeLabelW, self.frame.size.height)];
        hourLabel.text = @"00";
        hourLabel.textColor = [UIColor grayColor];
        hourLabel.layer.borderWidth = 0.5;
        hourLabel.textAlignment = NSTextAlignmentCenter;
        hourLabel.layer.borderColor = [UIColor blackColor].CGColor;
        hourLabel.font = TimeLabelFont;
        [self addSubview:hourLabel];
        self.hourLabel = hourLabel;
        
        UILabel *otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(hourLabel.frame.origin.x+hourLabel.frame.size.width, -2, JIANJU, hourLabel.frame.size.height)];
        otherLabel.text = @":";
        otherLabel.textAlignment = NSTextAlignmentCenter;
        otherLabel.textColor = [UIColor grayColor];
        [self addSubview:otherLabel];
        self.otherLabel = otherLabel;
        
        UILabel *minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(otherLabel.frame.origin.x+otherLabel.frame.size.width, 0, TimeLabelW, self.frame.size.height)];
        minuteLabel.text = @"00";
        minuteLabel.textColor = [UIColor grayColor];
        minuteLabel.layer.borderWidth = 0.5;
        minuteLabel.textAlignment = NSTextAlignmentCenter;
        minuteLabel.layer.borderColor = [UIColor grayColor].CGColor;
        minuteLabel.font = TimeLabelFont;
        [self addSubview:minuteLabel];
        self.minuteLabel = minuteLabel;
        
        UILabel *otherLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(minuteLabel.frame.origin.x+minuteLabel.frame.size.width, -2, JIANJU, minuteLabel.frame.size.height)];
        otherLabel1.text = @":";
        otherLabel1.textAlignment = NSTextAlignmentCenter;
        otherLabel1.textColor = [UIColor grayColor];
        [self addSubview:otherLabel1];
        self.otherLabel1 = otherLabel1;
        
        UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(otherLabel1.frame.origin.x+otherLabel1.frame.size.width, 0, TimeLabelW, self.frame.size.height)];
        secondLabel.text = @"00";
        secondLabel.textColor = [UIColor grayColor];
        secondLabel.layer.borderWidth = 0.5;
        secondLabel.textAlignment = NSTextAlignmentCenter;
        secondLabel.layer.borderColor = [UIColor grayColor].CGColor;
        secondLabel.font = TimeLabelFont;
        [self addSubview:secondLabel];
        self.secondLabel = secondLabel;
    } else {
        /****************************************文字倒计时****************************************/
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.self.frame.size.width, self.self.frame.size.height)];
        _bgView.backgroundColor = [UIColor clearColor];
        _bgView.alpha = 1;
        [self addSubview:_bgView];
        
        self.textTimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.textTimerLabel.text = @"距离结束00小时00分钟00秒";
        self.textTimerLabel.textColor = [UIColor grayColor];
        self.textTimerLabel.numberOfLines = 0;
        self.textTimerLabel.textAlignment = NSTextAlignmentCenter;
        self.textTimerLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.textTimerLabel];
        
    }
}

#pragma mark - 设置结束时间

- (void)setEndTime:(NSString *)endTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *currentDate = [NSDate date];
    NSDate *endDate = [formatter dateFromString:endTime];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:currentDate];
 
    [self startDown:interval];
}

//开始倒计时
- (void)startDown:(int)timeout1 {
    __block int timeout = timeout1;
    if (timeout<0) {
        return;
    }
    WWeakSelf;
    if (timeout!=0) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            
            if(timeout==0){ //倒计时结束，关闭
                
                if (self.timeOverBlock) {
                    self.timeOverBlock();
                }
                [self defaultSettingTime];
                
            }else if(timeout > 0){
                int second = (int)timeout%60;
                int minute = (int)(timeout%3600)/60;
                int hours = (int)(timeout)/3600;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (weakSelf.timeDownType == TimeDownTypeText) {
                        weakSelf.textTimerLabel.text = [NSString stringWithFormat:@"%d时%d分%d秒",hours,minute,second];
                        
                    } else {
                        
                        if (hours<10) {
                            self.hourLabel.text = [NSString stringWithFormat:@"0%d",hours];
                        }else{
                            self.hourLabel.text = [NSString stringWithFormat:@"%d",hours];
                        }
                        if (minute<10) {
                            self.minuteLabel.text = [NSString stringWithFormat:@"0%d",minute];
                        }else{
                            self.minuteLabel.text = [NSString stringWithFormat:@"%d",minute];
                        }
                        if (second<10) {
                            self.secondLabel.text = [NSString stringWithFormat:@"0%d",second];
                        }else{
                            self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
                        }
                        
                    }
                    
                });
                timeout--;
            }
        });
        dispatch_resume(_timer);
    }
}

- (void)defaultSettingTime{
    
    [self destroyTimer];
    WWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
    
        if (weakSelf.timeDownType == TimeDownTypeText) {
            weakSelf.textTimerLabel.text = @"已结束";
        } else {
            self.hourLabel.text = @"00";
            self.minuteLabel.text = @"00";
            self.secondLabel.text = @"00";
        }
    });
    
}

- (void)destroyTimer{
    
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor TextColor:(UIColor *)color radiuo:(CGFloat)rad{
    
    [self labelBGColor:backgroundColor rad:rad];
    
    [self labelTextColor:color];
}

- (void)setTextColor:(UIColor *)textColor{
    
    [self labelTextColor:textColor];
    
    if ([textColor isEqual:[UIColor whiteColor]]) {
        
        UIColor *wi = [UIColor blackColor];
        
        [self labelBGColor:wi rad:3];
    }
}

- (void)labelTextColor:(UIColor *)color{
    
    self.hourLabel.textColor = color;
    self.secondLabel.textColor = color;
    self.minuteLabel.textColor = color;
    
}

- (void)setTextFont:(UIFont *)textFont {
    self.hourLabel.font = textFont;
    self.secondLabel.font = textFont;
    self.minuteLabel.font = textFont;
}



- (void)labelBGColor:(UIColor *)bgColor rad:(CGFloat)rad{
    
    self.hourLabel.layer.cornerRadius = rad;
    self.hourLabel.layer.masksToBounds = YES;
    self.secondLabel.layer.cornerRadius = rad;
    self.secondLabel.layer.masksToBounds = YES;
    self.minuteLabel.layer.cornerRadius = rad;
    self.minuteLabel.layer.masksToBounds = YES;
    
    self.hourLabel.layer.borderColor = bgColor.CGColor;
    self.secondLabel.layer.borderColor = bgColor.CGColor;
    self.minuteLabel.layer.borderColor = bgColor.CGColor;
    
    self.hourLabel.backgroundColor = bgColor;
    self.secondLabel.backgroundColor = bgColor;
    self.minuteLabel.backgroundColor = bgColor;
}

@end
