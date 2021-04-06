//
//  ZJ_MarcoHeader.h
//  MyCodeApp
//
//  Created by 邹杰 on 4/6/21.
//

#ifndef ZJ_MarcoHeader_h
#define ZJ_MarcoHeader_h

//常用宽高
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarHeight (44)
#define kNavBar (iPhoneMAXR ? 88.0 : 64.0)
#define kTabBar (iPhoneMAXR  ? 83.0 : 49.0)
#define kStatusBar (iPhoneMAXR ? 44.0 : 22.0)
#define KTabSacl (iPhoneMAXR ? 34.0 : 0.1)


//机型判断
#define iPhoneMAXR (UIScreen.mainScreen.bounds.size.height >= 812.0 ? true : false)

#define isiPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

#define isiPhone6               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define isiPhone6PLUS ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && SCREEN_MAX_LENGTH == 736.0)

#define isiPhoneXs  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


// ================颜色相关================
#define WWRgbColor(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define WWRgbColorA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//弱引用
#define  WWeakSelf __weak typeof(self) weakSelf = self

//字符串判断为空
#define WWIsString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

//是否为空对象
#define WWISNullObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

// 防止多次调用
#define kPreventRepeatClickTime(_seconds_) \
static BOOL shouldPrevent; \
if (shouldPrevent) return; \
shouldPrevent = YES; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_seconds_) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
shouldPrevent = NO; \
}); \


//默认非网络请求点击间隔时间
#define StraightClickNormal   kPreventRepeatClickTime(KCLICKOTHERTIME)

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


#endif /* ZJ_MarcoHeader_h */
