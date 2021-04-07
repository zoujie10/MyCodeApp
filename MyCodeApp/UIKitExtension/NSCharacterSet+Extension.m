//
//  NSCharacterSet+Extension.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/7/21.
//

#import "NSCharacterSet+Extension.h"

@implementation NSCharacterSet (Extension)
+ (NSCharacterSet *)qmui_URLUserInputQueryAllowedCharacterSet {
    NSMutableCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet].mutableCopy;
    [set removeCharactersInString:@"#&="];
    return set.copy;
}
@end
