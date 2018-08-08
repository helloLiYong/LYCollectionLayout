

#import "NSDate+lY_Extention.h"

@implementation NSDate (ly)

- (BOOL)isThisYear
{
    // 判断self这个日期是否为今年
    NSCalendar *calendar = [NSCalendar currentCalendar];

    // 年
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];

    return selfYear == nowYear;
}
- (BOOL)isToday
{
    // 判断self这个日期是否为今天
    NSCalendar *calendar = [NSCalendar currentCalendar];

    // 获得年月日元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];

    return selfCmps.year == nowCmps.year
    && selfCmps.month == nowCmps.month
    && selfCmps.day == nowCmps.day;
}

- (BOOL)isYesterday
{
    // 判断self这个日期是否为昨天

    // self == 2015-10-31 23:07:08 -> 2015-10-31 00:00:00
    // now  == 2015-11-01 14:39:20 -> 2015-11-01 00:00:00

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";

    NSString *selfString = [fmt stringFromDate:self]; // 20151031
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20151101

    NSDate *selfDate = [fmt dateFromString:selfString]; // 2015-10-31 00:00:00
    NSDate *nowDate = [fmt dateFromString:nowString]; // 2015-11-01 00:00:00

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];

    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

- (BOOL)isTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";

    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];

    NSDate *selfDate = [fmt dateFromString:selfString];

    NSDate *nowDate = [fmt dateFromString:nowString];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];

    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}

@end
