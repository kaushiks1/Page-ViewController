//
//  Constant.h
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HT  [UIScreen mainScreen].bounds.size.height
#define WD  [UIScreen mainScreen].bounds.size.width

@interface Constant : NSObject

extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SUNDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_MONDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_TUESDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_WEDNESDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_THURSDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_FRIDAY;
extern NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SATURDAY;



///***** MAKE IT 0 FOR DEPLOYMENT*********/
//
//#define DEBUG 1
//
//#if DEBUG
//#define DebugLog(s, ...) NSLog(s, ##__VA_ARGS__)
//#else
//#define DebugLog(s, ...)
//#endif


@end
