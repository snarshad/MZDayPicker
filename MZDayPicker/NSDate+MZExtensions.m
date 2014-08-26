//
//  NSDate+MZExtensions.m
//  donna
//
//  Created by Arshad Tayyeb on 3/7/12.
//

#import "NSDate+MZExtensions.h"

static NSCalendar *g_gregorian = nil;

@interface NSDate (Extensions_private)
- (NSCalendar *)gregorianCalendar;
@end


@implementation NSDate (Extensions)

- (NSCalendar *)gregorianCalendar
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    return g_gregorian;
}

// returns midnight (beginning) of date
- (NSDate *)mz_floor
{
	
	NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = nil;
    @synchronized ([self gregorianCalendar])
    {
        components = [[self gregorianCalendar] components:unitFlags fromDate:self];	
    }
	components.hour = 0;
	components.minute = 0;
	
	NSDate *midnight = nil;
    @synchronized ([self gregorianCalendar])
    {
        midnight = [[self gregorianCalendar] dateFromComponents:components];
    }
	
	return midnight;
}

//returns 23:59:59 of date
- (NSDate *)mz_ceil
{
	NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = nil;
    @synchronized (g_gregorian)
    {
        components = [[self gregorianCalendar] components:unitFlags fromDate:self];	
    }
	components.hour = 23;
	components.minute = 59;
	components.second = 59;
	
    NSDate *dayEnd = nil;
    @synchronized (g_gregorian)
    {
        dayEnd = [[self gregorianCalendar] dateFromComponents:components];
    }
	
	return dayEnd;	
}

@end
