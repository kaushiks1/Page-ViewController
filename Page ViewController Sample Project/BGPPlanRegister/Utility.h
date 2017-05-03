//
//  Utility.h
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "Reachability.h"
#import "Constant.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger , WeekDay){
    SUNDAY = 1,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY
};

@interface Utility : NSObject

+ (BOOL)isInternetConnected_ShowPopupIfNotConnected:(BOOL)showPopup;
+ (NSString *)descriptionForObject:(id)objct;
+ (NSString *)getDateFormatFromDateString:(NSString *)dateAPI withFormat:(NSDateFormatter *)wFormat toFormat:(NSDateFormatter *)tFormat;
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;
+ (NSString*)stringFromDate:(NSDate*)date inFormat:(NSString*)requiredFormat;
+ (NSString *)stringByStrippingHTML:(NSString *)htmlString;
+ (NSString *)stringByStrippingHTMLListTags:(NSString *)htmlString;
+ (NSString *)stringByStrippingHTMLTags:(NSString *)htmlString;
+ (NSArray<NSString *> *)stringByStrippingByList:(NSString *)htmlString;
+ (BOOL)isValidEmail:(NSString *)checkString;
+ (BOOL)isValidPhone:(NSString *)checkString;
+ (UIActivityIndicatorView *)getActivityView:(UIView *)parentView withStyle:(UIActivityIndicatorViewStyle )style;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (NSArray*)timeUnitPassedbetween:(NSDate*)laterDate andPreviousDate:(NSDate*)previousDate;
+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate;
+ (NSInteger)dayOfMonth:(NSDate *)date;
+ (NSInteger)weekDayOfDate:(NSDate *)date;
+ (NSString *)monthOfDate:(NSDate *)date;
+ (NSString *)getSortWeekDayFromDate:(NSDate *)date;
+ (NSString *)suffixForDay:(NSInteger)day;
+ (NSDate *)combineDateComponentFromDate:(NSDate *)date1 timeComponentFromDate:(NSDate *)date2;
+ (NSUInteger )getWeekdayFromDate:(NSDate *)date;
+ (NSDictionary *)getBase64DecodedDictionary:(NSString *)base64String;
+ (NSString *)deviceUUID;
+ (NSUInteger)getWeekDayNumber:(NSString *)weekday;
+ (NSString *)trimString_RemoveWhiteSpaceFromString:(NSString *)string;
+ (void)showAlertControllerwithMessage:(NSString *)stringMessage;
+ (BOOL)isAbow18PlusAgeDateOfBirth:(NSString *)stringDateOfBirth;



@end
