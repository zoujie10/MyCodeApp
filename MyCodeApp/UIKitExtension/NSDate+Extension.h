//
//  NSDate+Extension.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)
///将标准格式（yyyy-MM-dd HH:mm:ss）的时间字符串转化为时间
+ (NSDate *)convertStandardDateStringToDateWithDateString:(NSString *)string;
+ (NSString *)convertDateString:(NSString *)dateString;

+ (NSDate *)convertDateWithDate:(NSDate *)date dateFormatString:(NSString*)string;

/// 将date转化成指定字符串样式的字符串
+ (NSString *)convertDateToStringWithDate:(NSDate *)date dateFormatString:(NSString*)string;


/// 将yyyy-MM-dd HH:mm:ss格式的时间字符串转化成指定格式的时间字符串
+ (NSString *)convertDateString:(NSString *)dateString dateFormatString:(NSString *)dateFormatString;


//获得校验过的当前时间date
+ (NSDate *)getVerifiedCurrentDate;

/**
 获得检验过的当前时间转化的时间字符串
 */
+ (NSString*)getVerifiedCurrentDateString;




/// 将标准格式的时间字符串转化成0000.00.00格式的字符串
+ (NSString *)convertStandardDateStringToDotString:(NSString *)string;







+ (NSString *)convertDateToString:(NSDate *)date;
+ (NSDate *)convertStringToDate:(NSString *)string;

/// 将yyyy-MM-dd HH:mm:ss格式的date转化成yyyy-MM-dd格式的字符串
+ (NSString *)convertStandardDataToShortDateString:(NSDate *)date;




/**
获得当前时间的指定格式的字符创 yyyy.MM.dd
 */
+ (NSString *)getNowDateDotString;


/**
 获得当月第一天日期的指定格式的字符串 yyyy.MM.dd
 */
+ (NSString *)getCurrentMonthFirstDayDateString;


/**
 获得当月最后一天日期的指定格式的字符串 yyyy.MM.dd


 */
+ (NSString *)getCurrentMonthLastDayDateString;


/**
 获得当月最后一天日期date

 */
+ (NSDate *)getCurrentMonthLastDayDate;



/**
 将2019.06.01格式的时间字符串转化成2019-06-01

 */
+(NSString *)convertDotStringToLineString:(NSString *)string;


/**
 将2019.06.01格式的时间字符串转化成20190601


 */
+ (NSString *)convertDotStringToString:(NSString *)string;

+ (NSString *)convertDotStringToUnLineString:(NSString *)string;


+ (NSTimeInterval )getTimeGapIntervalWithStartTimeString:(NSString *)startTimeString;


+ (BOOL)judgeIsToday:(NSInteger)timeInterval;

+ (BOOL)judgeIsPastDateWithDateString:(NSString *)dateString;




/**
 时间格式的字符串转interval
 */
+ (NSTimeInterval)getIntervalWithTime:(NSString *)time;



/**
 将给定的开始时间和当前时间，两个时间差转化为00：00形式的字符串

 */
+ (NSString *)getTimeGapWithStartTimeString:(NSString *)startTimeString;

/// 获得当前时间的年
+ (NSInteger )getNowDateYear;

///获得当前时间的月
+ (NSInteger )getNowDateMonth;

+ (NSInteger )getDateDayWithDate:(NSDate *)date;



/// 获得指定时间的年
+ (NSInteger )getDateYearWithDate:(NSDate *)date;
//获得当前时间的月
+ (NSInteger )getDateMonthWithDate:(NSDate *)date;
/// 获得指定时间的季度
+ (NSInteger )getDateQuarterWithDate:(NSDate *)date;

/// 计算距离指定时间还有多少天
+ (NSInteger)caculateLastDayCountWithPastDate:(NSString *)string;


/// 获得从指定时间开始加上对应几个月后的时间
/// @param date 开始时间
/// @param monthStep 月步长
+ (NSDate *)getDateWithStartDate:(NSDate *)date monthStep:(NSInteger)monthStep;


+ (NSDate *)getMonthFirstDayDateWithDate:(NSDate *)date;
+ (NSDate *)getMonthLastDayDateWithDate:(NSDate *)date;

+ (NSDate *)getYearFirstDayDateWithDate:(NSDate *)date;

+ (NSDate *)getYearLastDayDateWithDate:(NSDate *)date;

+ (NSDate *)getQuarterFirstDayDateWithDate:(NSDate *)date;
+ (NSDate *)getQuarterLastDayDateWithDate:(NSDate *)date;

+ (NSDate *)getDateWithStartDate:(NSDate *)date dayStep:(NSInteger)dayStep;
@end

NS_ASSUME_NONNULL_END
