//
//  CADatesManager
//
//  Created by Carlos Arenas on 10/11/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CADatesManager : NSObject

+ (NSDateComponents *)getDateComponents:(NSDate *)specificDate;
+ (NSDateComponents *)getComponentsPreviousMonth;
+ (NSDateComponents *)getComponentsFromCurrentMonth;
+ (NSRange)getNumberOfDaysForMonth:(NSInteger)monthNumber monthYear:(NSInteger)yearNumber;
+ (NSDate *)getCustomDateAfterDays:(NSDate *)date days:(NSInteger)days;
+ (NSDate *)dateWithNoHours:(NSDate *)specificDate;
+ (NSDate *)dateAfterDays:(NSDate *)date days:(NSInteger)days;
+ (NSDate *)addMinutesToDate:(NSDate *)date minutes:(NSInteger)minutes;
+ (NSDate *)substractMinutes:(NSDate *)date minutes:(NSInteger)minutes;
+ (NSDate *)setDateToSpecificHour:(NSDate *)date hour:(NSInteger)hour;
+ (NSDate *)setDateToSpecificHour:(NSDate *)date hour:(NSInteger)hour minute:(NSInteger)minute;
+ (NSTimeInterval)differenceBetweenDates:(NSDate *)date1 date2:(NSDate *)date2;
+ (NSTimeInterval)differenceBetweenDatesInDays:(NSDate *)date1 date2:(NSDate *)date2;
+ (NSString *)stringFromDateWithFormat:(NSDate *)date format:(NSString *)format;
+ (NSString *)formatDateFromString:(NSString *)d;
+ (NSString *)stringDateFromNSDate:(NSDate *)date withFormat:(NSDateFormatterStyle)format;

@end