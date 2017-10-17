//
//  SettingViewController.h
//  Restaurant App
//
//  Created by Jaha Rabari on 05/09/13.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface

SettingViewController:UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (nonatomic,strong) NSString *ComanyLogo,*ComapnyUrl,*ComapnySubtitle,*AppRedirectUrl,*EmailSubject,*MarketingContent,*textMessage, *prodName;
@property (nonatomic) NSInteger AppsId;
@end
