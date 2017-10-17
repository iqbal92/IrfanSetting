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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
