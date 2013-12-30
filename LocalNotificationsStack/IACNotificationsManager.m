//
//  IACNotificationsManager.m
//  LocalNotificationsStack
//
//  Created by iAcisclo MacBook on 29/12/13.
//  Copyright (c) 2013 iAcisclo. All rights reserved.
//

#import "IACNotificationsManager.h"

@implementation IACNotificationsManager

+(NSArray *)allNotifications{
    
    return [[UIApplication sharedApplication]scheduledLocalNotifications];
}

+(void)cancelAllNotifications{
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
}

+(void)cancelNotification:(UILocalNotification *)notification{
    
    NSArray *allNotificarions = [self allNotifications];
    
    for (UILocalNotification *localNotification in allNotificarions) {
        
        if ([localNotification isEqual:notification]) {
            
            [[UIApplication sharedApplication]cancelLocalNotification:localNotification];
        }
    }
}

+(void)createNotification:(UILocalNotification *)notification{

    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
}

+(void)createNotificationWithTitle:(NSString *)title
                              date:(NSDate *)date{
    
    [self createNotificationWithTitle:title
                                 date:date
                          buttonTitle:@"Go to App"
                        repeatedDaily:NO
                       repeatedWeekly:NO];

}

+(void)createNotificationWithTitle:(NSString *)title
                              date:(NSDate *)date
                       buttonTitle:(NSString *)buttonTitle
                     repeatedDaily:(BOOL)repeatedDaily
                    repeatedWeekly:(BOOL)repeatedWeekly{
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];

    //sonido que emite la notificación
    localNotification.soundName            = UILocalNotificationDefaultSoundName;
    //fecha de alerta
    localNotification.fireDate             = date;
    //título de la Notificación
    localNotification.alertBody            = title;
    //titulo del boton de acción(en caso de estar la aplicación inactiva abre la misma)
    localNotification.alertAction          = buttonTitle;
    //si el usuario pulsta el botón anterior y esta propiedad esta a YES la aplicación se abre, en caso contratio no hace nada.
    localNotification.hasAction            = YES;

    if (repeatedDaily) {
        localNotification.repeatInterval = NSDayCalendarUnit;
    }
    
    if (repeatedWeekly) {
        localNotification.repeatInterval = NSWeekCalendarUnit;
    }
    
    [self createNotification:localNotification];
}




@end
