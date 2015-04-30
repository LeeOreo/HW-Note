//
//  ViewController.m
//  HW-Note
//
//  Created by 李育豪 on 2015/4/30.
//  Copyright (c) 2015年 ALPHACamp. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)removeLocalNotification {
    
    for(UILocalNotification *noti in [UIApplication sharedApplication].scheduledLocalNotifications)
    {
        if(noti.userInfo[@"不能說的秘密"])
        {
            [[UIApplication sharedApplication] cancelLocalNotification:noti];
            
        }
    }
    
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (IBAction)giveMeFive:(id)sender {
    
    
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDate *now = [NSDate date];
    NSDate *notiDate = [now dateByAddingTimeInterval:10];
    localNotification.fireDate = notiDate;
    localNotification.alertBody = @"驚!!不看會後悔";
    localNotification.alertAction = @"點擊看更多^^";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.soundName = @"ringtone.wav";
    //localNotification.userInfo = @{@"不能說的秘密" : @"彼得潘老師喜歡溫蒂"};
    //localNotification.repeatInterval = NSCalendarUnitMonth;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}

-(void)closeAlert {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if(delegate.isOpenFromLocalNotification) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"start from local notification" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
        [self performSelector:@selector(closeAlert) withObject:nil afterDelay:1];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
