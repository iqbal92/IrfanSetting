# IrfanSetting

1. Drage and Drop Setting Folder
2. Target Membership is enable to all droped Viewcontroller and images
3. if you are using objective then ** #import "SettingViewController.h"  **

4. In Last Step

SettingViewController *Setting = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:Setting];
[self presentViewController:navController animated:YES completion:nil];

// Pass your parameter

        Setting->ComanyLogo = @"your companylogo";
        Setting->ComapnyUrl = @"your comapny url";
        Setting->ComapnySubtitle = @"Pixster Studio";
        Setting->AppsId = 123456789;
        Setting->AppRedirectUrl = @"your url";
        Setting->EmailSubject = @"FeedBack";
        Setting->MarketingContent = @"Test Test Test Test Test Test"; //Fb Twitter Mail Detail
        Setting->textMessage = @"Test Test Test";
            
Note :
    if you are using swift then create Bridging file and add #import "SettingViewController.h"  in your BridgingHeaderFile

        1. your project name-Bridging-Header.h
        2. $(PROJECT_DIR)/$(PROJECT_NAME)/$(PROJECT_NAME)-Bridging-Header.h

     // Use this
    let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
    let navObj = UINavigationController(rootViewController: vc)
    self.present(navObj, animated: true, completion: nil)
    
    
