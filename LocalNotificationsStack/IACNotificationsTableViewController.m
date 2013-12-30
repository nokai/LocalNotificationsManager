//
//  IACNotificationsTableViewController.m
//  LocalNotificationsStack
//
//  Created by iAcisclo MacBook on 29/12/13.
//  Copyright (c) 2013 iAcisclo. All rights reserved.
//

#import "IACNotificationsTableViewController.h"
#import "IACNotificationsManager.h"
#import "IACAddNotificationViewController.h"

@interface IACNotificationsTableViewController ()<IACAddNotificationViewControllerDelegate>{
    
    IACNotificationsManager *manager;
    NSMutableArray          *notifications;
    NSDateFormatter         *formatter;
}

@end

@implementation IACNotificationsTableViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    // botones
    [self setUpButtons];
    // modelo
    [self loadModel];
    //common
    [self setUpCommonElements];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)setUpCommonElements{
    formatter = [NSDateFormatter new];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm:ss";
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configure Views

-(void)setUpButtons{

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNotification:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

#pragma mark - Action Buttons

-(void)insertNotification:(id)sender{
    
    IACAddNotificationViewController *addVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IACAddNotificationViewController"];
    addVC.delegate = self;
    [self presentViewController:addVC animated:YES completion:NULL];
    
}

#pragma mark - Model

-(void)loadModel{

    notifications = [IACNotificationsManager allNotifications].mutableCopy;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UILocalNotification * localNotification = [notifications objectAtIndex:indexPath.row];

    cell.textLabel.text       = localNotification.alertBody;
    cell.detailTextLabel.text = [formatter stringFromDate:localNotification.fireDate];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        UILocalNotification *localNotification = [notifications objectAtIndex:indexPath.row];
        [IACNotificationsManager cancelNotification:localNotification];
        [notifications removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - IACAddNotificationViewController delegate

-(void)IACAddNotificationViewControllerDidEndEditing:(IACAddNotificationViewController *)IACAddNotificationViewController{
    
    [self loadModel];
}
@end
