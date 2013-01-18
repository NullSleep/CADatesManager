//
//  CADatesManager
//
//  Created by Carlos Arenas on 10/11/11.
//  Copyright 2011. All rights reserved.
//

#import "CADatesManager.h"

@implementation CADatesManager

+ (NSDateComponents *)getDateComponents:(NSDate *)specificDate{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *current =[gregorian components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | kCFCalendarUnitHour | kCFCalendarUnitMinute | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)
                                            fromDate:specificDate];
    return current;
}

+ (NSDateComponents *)getComponentsPreviousMonth{
    NSDateComponents *currentMonth=[self getDateComponents:[NSDate date]];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    if([currentMonth month]==1){
        [components setMonth:12];
        [components setYear:[currentMonth year]-1];
    }
    else{
        [components setMonth:[currentMonth month]-1];
        [components setYear:[currentMonth year]];
    }
    
    NSDate *particularDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *prevMonthComps = [gregorian components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | kCFCalendarUnitHour | kCFCalendarUnitMinute) fromDate:particularDate];
    
    return prevMonthComps;
}

+ (NSDateComponents *)getComponentsFromCurrentMonth{
    NSDateComponents *currentMonth=[self getDateComponents:[NSDate date]];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:[currentMonth month]];
    [components setYear:[currentMonth year]];
    
    NSDate *particularDate= [[NSCalendar currentCalendar] dateFromComponents:components];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | kCFCalendarUnitHour | kCFCalendarUnitMinute) fromDate:particularDate];
    
    return weekdayComponents;
}

+ (NSRange)getNumberOfDaysForMonth:(NSInteger)monthNumber monthYear:(NSInteger)yearNumber{
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:monthNumber];
    [comps setYear:yearNumber];
    
    NSRange range=[cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[cal dateFromComponents:comps]];
    
    return range;
}

+ (NSDate *)getCustomDateAfterDays:(NSDate *)date days:(NSInteger) days{
    NSDateComponents *currentMonth=[self getDateComponents:date];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[currentMonth day] + days];
    [components setMonth:[currentMonth month]];
    [components setYear:[currentMonth year]];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)dateWithNoHours:(NSDate *)specificDate{
    NSDateComponents *dateComps=[self getDateComponents:specificDate];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[dateComps day]];
    [components setMonth:[dateComps month]];
    [components setYear:[dateComps year]];
    
    NSDate *partuclarDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return partuclarDate;
}

+ (NSTimeInterval)differenceBetweenDates:(NSDate *)date1 date2:(NSDate *)date2{
    return [date1 timeIntervalSinceDate:date2];
}

+ (NSTimeInterval)differenceBetweenDatesInDays:(NSDate *)date1 date2:(NSDate *)date2{
    return [date1 timeIntervalSinceDate:date2]/86400;
}

+ (NSString *)stringFromDateWithFormat:(NSDate *)date format:(NSString *)format{    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateAfterDays:(NSDate *)date days:(NSInteger)days{
    return [date addTimeInterval:60*60*24*days];
}

+ (NSDate *)addMinutesToDate:(NSDate *)date minutes:(NSInteger)minutes{
    return [date addTimeInterval:60*minutes];
}

+ (NSDate *)substractMinutes:(NSDate *)date minutes:(NSInteger)minutes{
    NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents=[[NSDateComponents alloc] init];
    [offsetComponents setMinute:-minutes]; // note that I'm setting it to -1
    NSDate *newDate=[gregorian dateByAddingComponents:offsetComponents toDate:date options:0];

    return newDate;
}

+ (NSString *)formatDateFromString:(NSString *)d{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d-MM-yy"];
    NSDate *date = [dateFormatter dateFromString:d];
    [dateFormatter setDateFormat:@"d-MM-yyyy"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringDateFromNSDate:(NSDate *)date withFormat:(NSDateFormatterStyle)format{
    NSDateFormatter *df=[[NSDateFormatter alloc] init];
    df.dateStyle=format;
    NSString *dateString=[NSString stringWithFormat:@"%@", [df stringFromDate:date]];
    return dateString;
}

+ (NSDate *)setDateToSpecificHour:(NSDate *)date hour:(NSInteger)hour{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *components=[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit)
                                             fromDate:date];
    [components setHour:hour];
    return [calendar dateFromComponents:components];
}

+ (NSDate *)setDateToSpecificHour:(NSDate *)date hour:(NSInteger)hour minute:(NSInteger)minute{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *components=
    [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    
    [components setHour:hour];
    [components setMinute:minute];
    
    return [calendar dateFromComponents:components];
}

@end