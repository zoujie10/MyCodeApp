//
//  ZJ_MarcoHeader.h
//  MyCodeApp
//
//  Created by 邹杰 on 4/6/21.
//

#ifndef ZJ_MarcoHeader_h
#define ZJ_MarcoHeader_h


/// 设备类型
#define IS_IPAD [ZJ_MarcoHelper isIPad]
#define IS_IPOD [ZJ_MarcoHelper isIPod]
#define IS_IPHONE [ZJ_MarcoHelper isIPhone]
#define IS_SIMULATOR [ZJ_MarcoHelper isSimulator]


/// 是否横竖屏
/// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
/// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

/// 屏幕宽度，会根据横竖屏的变化而变化
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

/// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

/// 屏幕宽度，跟横竖屏无关
#define DEVICE_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

/// 屏幕高度，跟横竖屏无关
#define DEVICE_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarHeight (44)
#define kNavBar (iPhoneMAXR ? 88.0 : 64.0)
#define kTabBar (iPhoneMAXR  ? 83.0 : 49.0)
#define kStatusBar (iPhoneMAXR ? 44.0 : 22.0)
#define KTabSacl (iPhoneMAXR ? 34.0 : 0.1)

/// 是否Retina
#define IS_RETINASCREEN ([[UIScreen mainScreen] scale] >= 2.0)

/// 是否放大模式（iPhone 6及以上的设备支持放大模式）
#define IS_ZOOMEDMODE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeScale)] ? (ScreenNativeScale > ScreenScale) : NO)

#pragma mark - 变量-布局相关

/// 获取一个像素
#define PixelOne [QMUIHelper pixelOne]

/// bounds && nativeBounds / scale && nativeScale
#define ScreenBoundsSize ([[UIScreen mainScreen] bounds].size)
#define ScreenNativeBoundsSize ([[UIScreen mainScreen] nativeBounds].size)
#define ScreenScale ([[UIScreen mainScreen] scale])
#define ScreenNativeScale ([[UIScreen mainScreen] nativeScale])

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
