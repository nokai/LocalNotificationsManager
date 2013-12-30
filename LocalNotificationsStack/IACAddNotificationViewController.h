//
//  IACAddNotificationViewController.h
//  LocalNotificationsManager
//
//  Created by iAcisclo MacBook on 29/12/13.
//  Copyright (c) 2013 iAcisclo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IACAddNotificationViewController;

@protocol IACAddNotificationViewControllerDelegate <NSObject>

-(void)IACAddNotificationViewControllerDidEndEditing:(IACAddNotificationViewController *)IACAddNotificationViewController;

@end

@interface IACAddNotificationViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField  *txfNotificationTitle;
@property (weak, nonatomic) IBOutlet UISwitch     *swtDaily;
@property (weak, nonatomic) IBOutlet UISwitch     *swtWeekly;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerNotification;
@property (weak, nonatomic) id<IACAddNotificationViewControllerDelegate>delegate;

- (IBAction)saveNotification:(id)sender;

@end
