//
//  CompanyViewController.h
//  SettingScreen
//
//  Created by Pixster Macmini2 on 17/10/17.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *CompanyDetail;
@property (weak, nonatomic) NSString *CompanyUrl;
@property (weak, nonatomic) NSString *CompanyTitle;

@end
