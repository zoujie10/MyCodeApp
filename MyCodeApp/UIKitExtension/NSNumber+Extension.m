//
//  NSNumber+Extension.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/7/21.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)
- (CGFloat)qmui_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return self.doubleValue;
#else
    return self.floatValue;
#endif
}
@end
