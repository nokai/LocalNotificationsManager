//
//  IACAddNotificationViewController.m
//  LocalNotificationsManager
//
//  Created by iAcisclo MacBook on 29/12/13.
//  Copyright (c) 2013 iAcisclo. All rights reserved.
//

#import "IACAddNotificationViewController.h"
#import "IACNotificationsManager.h"

@interface IACAddNotificationViewController ()

@end

@implementation IACAddNotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.txfNotificationTitle.delegate = self;
    self.datePickerNotification.locale = [NSLocale localeWithLocaleIdentifier:@"es_ES"];
    self.datePickerNotification.datePickerMode = UIDatePickerModeDateAndTime;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNotification:(id)sender {
    
    [IACNotificationsManager createNotificationWithTitle:self.txfNotificationTitle.text
                                                    date:self.datePickerNotification.date
                                             buttonTitle:@"Go to App"
                                           repeatedDaily:self.swtDaily.isOn
                                          repeatedWeekly:self.swtWeekly.isOn];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        [self.delegate IACAddNotificationViewControllerDidEndEditing:self];
    }];
    
}
@end
