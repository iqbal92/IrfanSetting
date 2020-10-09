//
//  CompanyViewController.m
//  SettingScreen
//
//  Created by Pixster Macmini2 on 17/10/17.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _CompanyDetail.backgroundColor = [UIColor whiteColor];
    
    self.title = _CompanyTitle;
    
    NSURL *websiteUrl = [NSURL URLWithString:_CompanyUrl];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    
    [_CompanyDetail loadRequest:urlRequest];
}

-(IBAction)onTapCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
    func setNotificationEndFast(identifire : Int) {
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["sdfsdfds"])
        
        let content = UNMutableNotificationContent()
        content.title = "sdfd"
        content.categoryIdentifier = "sdfsdf"
        content.body = "sdfsdfsdf"
        content.sound = UNNotificationSound.default
        
        let triggerDateComponent = Calendar.current.dateComponents([.day, .hour, .minute], from: Date().addHours(identifire))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "fast end", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
           if error != nil {
               print(error!)
               
           } else {
               print("\(request.description)")
           }
       })
    }
*/


/*
GET PENDING NOTIFICATION
center.getPendingNotificationRequests { (notifications) in
            print("Count: \(notifications.count)")
                
            for item in notifications {
                
                let id = item.identifier
                let time = item.content
                let categoryId = time.categoryIdentifier
                print(time)
                print("id: \(id)")
                guard let trigger = item.trigger as? UNCalendarNotificationTrigger else { return }
                var day = trigger.dateComponents.weekday
                let nextFireDate = trigger.nextTriggerDate()
                let title = item.content.body
                }
   }

*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
