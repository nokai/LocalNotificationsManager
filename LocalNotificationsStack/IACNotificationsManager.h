//
//  IACNotificationsManager.h
//  LocalNotificationsStack
//
//  Created by iAcisclo MacBook on 29/12/13.
//  Copyright (c) 2013 iAcisclo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IACNotificationsManager : NSObject

+(NSArray *)allNotifications;

+(void)createNotification:(UILocalNotification *)notification;

+(void)createNotificationWithTitle:(NSString *)title date:(NSDate *)date;

+(void)createNotificationWithTitle:(NSString *)title date:(NSDate *)date buttonTitle:(NSString *)buttonTitle repeatedDaily:(BOOL)repeatedDaily repeatedWeekly:(BOOL)repeatedWeekly;

+(void)cancelAllNotifications;

+(void)cancelNotification:(UILocalNotification *)notification;


@end
