//
//  UITextField+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/17.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)
-(BOOL)judgeTextContentIsContainEmoji{
	NSString *text = self.text;
	if (text.length > 0) {
		NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
		NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
		NSTextCheckingResult *result = [regex firstMatchInString:text options:0 range:NSMakeRange(0, text.length)];
		return (result != nil);
	}else {
		return NO;
	}
}
@end
