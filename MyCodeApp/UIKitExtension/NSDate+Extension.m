//
//  NSDate+Extension.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/21.
//

#import "NSDate+Extension.h"

static NSString  * const standardDateFormatString = @"yyyy-MM-dd HH:mm:ss";

static NSString  * const shortDateFormatString = @"yyyy-MM-dd";

@implementation NSDate (Extension)
//将标准格式（yyyy-MM-dd HH:mm:ss）的时间字符串转化为时间
+ (NSDate *)convertStandardDateStringToDateWithDateString:(NSString *)dateString
{
	

	return [self convertDateStringToDateWithDateStirng:dateString dateFormatString:standardDateFormatString];
}

+ (NSDate *)convertDateStringToDateWithDateStirng:(NSString*)dateString dateFormatString:(NSString *)dateFormatString
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	   //设置格式：zzz表示时区
	[dateFormatter setDateFormat:dateFormatString];
	   
	NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得当前系统的时区
	   
	[dateFormatter setTimeZone:zone];// 设定时区

	NSDate *date = [dateFormatter dateFromString:dateString];
	
	
	return date;
}

//获得校验过的当前时间的字符串格式数据
+ (NSString*)getVerifiedCurrentDateString
{
	 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	   //设置格式：zzz表示时区
	[dateFormatter setDateFormat:standardDateFormatString];
	   
	NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得当前系统的时区
	   
	[dateFormatter setTimeZone:zone];// 设定时区

	NSString *currentDateString = [dateFormatter stringFromDate:[self getVerifiedCurrentDate]];
	
	return currentDateString;
}
//获得校验过的当前时间date
+ (NSDate *)getVerifiedCurrentDate{
   
	NSTimeInterval currentServerTimeInterval = [[NSDate date] timeIntervalSince1970] + [[[NSUserDefaults standardUserDefaults] objectForKey:@"LocalTimeGap"] doubleValue];
	   
	NSDate *serverDate = [NSDate dateWithTimeIntervalSince1970:currentServerTimeInterval];
	
	return serverDate;
	
}




+ (NSInteger )getDateDayWithDate:(NSDate *)date
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitDay;
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	return dateComponents.day;
}

/// 获得指定时间的年
+ (NSInteger )getDateYearWithDate:(NSDate *)date
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitYear;
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	return dateComponents.year;
}
/// 获得指定时间的季度
+ (NSInteger )getDateQuarterWithDate:(NSDate *)date
{
	NSInteger month = [self getDateMonthWithDate:date];

	return (month-1)/3 + 1;
}

//获得当前时间的月
+ (NSInteger )getDateMonthWithDate:(NSDate *)date
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitMonth;
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];
	   
	  
	return dateComponents.month;
}
//获得当前时间的年
+ (NSInteger )getNowDateYear
{

	  
	return [self getDateYearWithDate:[NSDate date]];
}

//获得当前时间的月
+ (NSInteger )getNowDateMonth
{

	   
	  
	return [self getDateMonthWithDate:[NSDate date]];
}


+ (NSString *)getNowDateDotString
{
	NSCalendar *chineseCalendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitYear
	| NSCalendarUnitMonth|NSCalendarUnitDay;
	NSDateComponents *dateComponents = [chineseCalendar components:unitType fromDate:[NSDate date]];
	
   
	NSString * nowDateDotString = [NSString stringWithFormat:@"%ld.%02ld.%02ld",dateComponents.year,dateComponents.month,dateComponents.day];
	
	
	
	return nowDateDotString;
}

+ (NSString *)getCurrentMonthFirstDayDateString
{
	NSString *firstDayDateString = [NSString string];
	NSCalendar *chineseCalendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitYear
	| NSCalendarUnitMonth;
	//得到特定日期的年、月、日数据
	NSDateComponents *dateComponents = [chineseCalendar components:unitType fromDate:[NSDate date]];
	firstDayDateString = [NSString stringWithFormat:@"%ld.%02ld.01",dateComponents.year,dateComponents.month];
	return firstDayDateString;
}

+ (NSString *)getCurrentMonthLastDayDateString
{
	NSString *lastDayDateString = [NSString string];
	NSCalendar *chineseCalendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitYear
	| NSCalendarUnitMonth;
	//得到特定日期的年、月、日数据
	NSDateComponents *dateComponents = [chineseCalendar components:unitType fromDate:[NSDate date]];
	
	//一个月的天数
	NSRange currentMonthRange = [chineseCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
	lastDayDateString = [NSString stringWithFormat:@"%ld.%02ld.%02ld",dateComponents.year,dateComponents.month,currentMonthRange.length];
	return lastDayDateString;
}

+ (NSDate *)getMonthFirstDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	
	
	[resultDateComponents setYear:dateComponents.year];

	[resultDateComponents setMonth:dateComponents.month];
	
	[resultDateComponents setDay:1];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	return resultDate;
}

+ (NSDate *)getMonthLastDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	
	NSRange currentMonthRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];

	
	[resultDateComponents setYear:dateComponents.year];

	[resultDateComponents setMonth:dateComponents.month];
	
	[resultDateComponents setDay:currentMonthRange.length];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	return resultDate;
}
+ (NSDate *)getYearFirstDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	
	
	[resultDateComponents setYear:dateComponents.year];

	[resultDateComponents setMonth:1];
	
	[resultDateComponents setDay:1];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	return resultDate;
}

+ (NSDate *)getYearLastDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	

	
	[resultDateComponents setYear:dateComponents.year];

	[resultDateComponents setMonth:12];
	
	[resultDateComponents setDay:1];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	
	
	NSRange currentMonthRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:resultDate];
	[resultDateComponents setDay:currentMonthRange.length];
	
	resultDate = [calendar dateFromComponents:resultDateComponents];

	

	return resultDate;
}

+ (NSDate *)getQuarterFirstDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	
	
	[resultDateComponents setYear:dateComponents.year];
	
	NSInteger quarter = [self getDateQuarterWithDate:date];

	[resultDateComponents setMonth:3*(quarter - 1) + 1];
	
	[resultDateComponents setDay:1];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	return resultDate;
}

+ (NSDate *)getQuarterLastDayDateWithDate:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSCalendarUnit unitType =  NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;

	
	NSDateComponents *dateComponents = [calendar components:unitType fromDate:date];

	
	NSDateComponents *resultDateComponents = [[NSDateComponents alloc]init];
	

	
	[resultDateComponents setYear:dateComponents.year];
	NSInteger quarter = [self getDateQuarterWithDate:date];


	[resultDateComponents setMonth:3*quarter];
	
	[resultDateComponents setDay:1];

	NSDate *resultDate = [calendar dateFromComponents:resultDateComponents];
	
	
	NSRange currentMonthRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:resultDate];
	[resultDateComponents setDay:currentMonthRange.length];
	
	resultDate = [calendar dateFromComponents:resultDateComponents];

	

	return resultDate;
}

+ (NSDate *)getCurrentMonthLastDayDate
{
	return [self convertStringToDate:[self getCurrentMonthLastDayDateString]];
}

/// 将标准格式的时间字符串转化成0000.00.00格式的字符串
+ (NSString *)convertStandardDateStringToDotString:(NSString *)string
{
	return [self convertDateToString:[self convertStandardDateStringToDateWithDateString:string]];
}


+ (NSString *)convertDateToString:(NSDate *)date
{
	NSString *dateString = [NSString string];
	
	
	NSCalendar *chineseCalendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitType = NSCalendarUnitYear
	| NSCalendarUnitMonth
	| NSCalendarUnitDay;
	//得到特定日期的年、月、日数据
	NSDateComponents *dateComponents = [chineseCalendar components:unitType fromDate:date];
	dateString = [NSString stringWithFormat:@"%ld.%02ld.%02ld",dateComponents.year,dateComponents.month,dateComponents.day];

	return dateString;
}


+ (NSString *)convertDateString:(NSString *)dateString dateFormatString:(NSString *)dateFormatString
{
	return [self convertDateToStringWithDate:[self convertStandardDateStringToDateWithDateString:dateString] dateFormatString:dateFormatString];
}

+ (NSString *)convertDateString:(NSString *)dateString
{
	return [self convertDateToStringWithDate:[self convertStandardDateStringToDateWithDateString:dateString] dateFormatString:standardDateFormatString];
}
+ (NSDate *)convertDateWithDate:(NSDate *)date dateFormatString:(NSString*)string
{
	NSString *dateString = [self convertDateToStringWithDate:date dateFormatString:string];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		 //设置格式：zzz表示时区
	[dateFormatter setDateFormat:string];
		 
	NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得当前系统的时区
		 
	[dateFormatter setTimeZone:zone];// 设定时区

	NSDate *resultDate = [dateFormatter dateFromString:dateString];
	  
	  
	return resultDate;
 
}
/// 将date转化成指定字符串样式的字符串
+ (NSString *)convertDateToStringWithDate:(NSDate *)date dateFormatString:(NSString*)string
{
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		 //设置格式：zzz表示时区
	  [dateFormatter setDateFormat:string];
		 
	  NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得当前系统的时区
		 
	  [dateFormatter setTimeZone:zone];// 设定时区

	  NSString *dateString = [dateFormatter stringFromDate:date];
	  
	  
	  return dateString;
}

/// 将yyyy-MM-dd HH:mm:ss格式的date转化成yyyy-MM-dd格式的字符串
+ (NSString *)convertStandardDataToShortDateString:(NSDate *)date
{
 
	
	
	return [self convertDateToStringWithDate:date dateFormatString:shortDateFormatString];
}




+ (NSDate *)convertStringToDate:(NSString *)string
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy.MM.dd"];
	NSDate *date = [dateFormatter dateFromString:string];
	return date;
}


+ (NSString *)convertDotStringToLineString:(NSString *)string
{
	NSArray *array = [string componentsSeparatedByString:@"."];
	
	return [NSString stringWithFormat:@"%@-%@-%@",array[0],array[1],array[2]];
}

+ (NSString *)convertDotStringToString:(NSString *)string
{
	NSArray *array = [string componentsSeparatedByString:@"."];
	
	return [NSString stringWithFormat:@"%@%@%@",array[0],array[1],array[2]];
}

+ (NSString *)convertDotStringToUnLineString:(NSString *)string
{
	NSArray *array = [string componentsSeparatedByString:@"."];
	
	return [NSString stringWithFormat:@"%@/%@/%@",array[0],array[1],array[2]];
}


//时间格式的字符串转interval
+ (NSTimeInterval)getIntervalWithTime:(NSString *)time
{
	 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:standardDateFormatString];
	[dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];//解决8小时时间差问题
	NSDate *date = [dateFormatter dateFromString:time];
	
	return [date timeIntervalSince1970];
}

//将给定的开始时间和当前时间，两个时间差转化为00：00形式的字符串
+ (NSString *)getTimeGapWithStartTimeString:(NSString *)startTimeString
{
   

	NSTimeInterval gapInterval = [self getTimeGapIntervalWithStartTimeString:startTimeString];
	
	NSInteger hour = (NSInteger)gapInterval/(60*60);
	NSInteger minute = (NSInteger)(gapInterval - hour*60*60)/60;
	NSInteger second = (NSInteger)(gapInterval - hour*60*60)%60;
	
	NSString *timeGapString = timeGapString = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hour,minute,second];
	
	return timeGapString;
}


+ (NSTimeInterval )getTimeGapIntervalWithStartTimeString:(NSString *)startTimeString
{
	NSTimeInterval startInterval = [self getIntervalWithTime:startTimeString];
	
	NSTimeInterval currentServerTimeInterval = [[NSDate date] timeIntervalSince1970] + [[[NSUserDefaults standardUserDefaults] objectForKey:@"LocalTimeGap"] integerValue];
	
	NSTimeInterval gapInterval = currentServerTimeInterval - startInterval;
	
	return gapInterval;
}






//判断是不是今天
+ (BOOL)judgeIsToday:(NSInteger)timeInterval
{
	if (timeInterval == 0) {
		return YES;
	}
	
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
	NSCalendar* calendar = [NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
	NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date];
	NSDateComponents* comp2 = [calendar components:unitFlags fromDate:[NSDate date]];
	
	return [comp1 day]   == [comp2 day] &&
	[comp1 month] == [comp2 month] &&
	[comp1 year]  == [comp2 year];
}

+ (BOOL)judgeIsPastDateWithDateString:(NSString *)dateString

{
	NSDate *date = [self convertDateStringToDateWithDateStirng:dateString dateFormatString:shortDateFormatString];
	NSDate *nowDate = [self convertDateWithDate:[NSDate date] dateFormatString:shortDateFormatString];
	
	NSTimeInterval dateInterval = [date timeIntervalSince1970];
	NSTimeInterval nowDateInterval = [nowDate timeIntervalSince1970];
	
	
	
	if (dateInterval - nowDateInterval < 0) {
		return YES;
	}
	
	return NO;
}
//计算距离指定时间还有几天
+ (NSInteger)caculateLastDayCountWithPastDate:(NSString *)string
{
	
	NSDate *nowDate = [self getVerifiedCurrentDate];
	
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = standardDateFormatString;
	NSDate *pastDate = [formatter dateFromString:string];
	
 
	// 2.创建日历
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSCalendarUnit type =  NSCalendarUnitDay;
	// 3.利用日历对象比较两个时间的差值
	NSDateComponents *cmps = [calendar components:type fromDate:nowDate toDate:pastDate options:0];
	// 4.输出结果
	if (cmps < 0) {
		return 0;
	}
	return cmps.day + 1;
}


+ (NSDate *)getDateWithStartDate:(NSDate *)date monthStep:(NSInteger)monthStep
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
	
	[dateComponents setMonth:monthStep];
	
	
	NSDate *resultDate = [calendar dateByAddingComponents:dateComponents toDate:date options:0];
	return resultDate;
}

+ (NSDate *)getDateWithStartDate:(NSDate *)date dayStep:(NSInteger)dayStep
{
	NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
	
	[dateComponents setDay:dayStep];
	
	
	NSDate *resultDate = [calendar dateByAddingComponents:dateComponents toDate:date options:0];
	return resultDate;
}

@end
