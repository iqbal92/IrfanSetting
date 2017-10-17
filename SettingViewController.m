//
//  SettingViewController.m
//  Restaurant App
//
//  Created by Jaha Rabari on 05/09/13.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import "SettingViewController.h"
#import <Social/Social.h>
#import "TableViewCell.h"
#import "CompanyViewController.h"
#import "DAAppsViewController.h"
@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tbl_Setting;

@end

@implementation SettingViewController

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
   
    [self.tbl_Setting registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _tbl_Setting.backgroundColor = [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0];
    [self Navbar];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    _prodName = [info objectForKey:@"CFBundleDisplayName"];
    //NSLog(@"%@",prodName);
    
}

-(void)Navbar {
    
    _tbl_Setting.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Close"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(onTapCancel:)];
    
    sendButton.tintColor = [UIColor blackColor];

    
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"Avenir-Roman" size:15.0], NSForegroundColorAttributeName: [UIColor blackColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = sendButton;
    
}
-(void)dismiss {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onTapCancel:(id)sender {
    
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    self.navigationItem.title=@"Settings";
    
}
-(void)viewDidDisappear:(BOOL)animated{
   // self.navigationItem.title=@"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 4;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle;
    
    if (section==0) {
        sectionTitle = @"About";
    }else if(section==1){
        sectionTitle = @"Feedback";
    }else if(section==2){
        sectionTitle = @"Support us by sharing";
    }else{
        sectionTitle = @"About App";
    }
    return sectionTitle;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel * sectionHeader = [[UILabel alloc] initWithFrame:CGRectZero];
    sectionHeader.backgroundColor = [UIColor colorWithRed:248.0/255.0f green:248.0/255.0f blue:248.0/255.0f alpha:1.0];
    //sectionHeader.textAlignment = NSTextAlignmentCenter;
    sectionHeader.font = [UIFont fontWithName:@"Avenir-Black" size:22];
    sectionHeader.textColor = [UIColor blackColor];
    
    switch(section) {
        case 0:sectionHeader.text = @"    About"; break;
        case 1:sectionHeader.text = @"    Feedback"; break;
        case 2:sectionHeader.text = @"    Support us by sharing"; break;
        case 3:sectionHeader.text = @"    About App"; break;
        default:sectionHeader.text = @"  TITLE OTHER"; break;
    }
    return sectionHeader;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
        return 70;
    
    return 60;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else   if (section==1) {
        return 2;
    }else if (section==2) {
        return 4;
    }else{
        
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"cell";
	TableViewCell *cell = (TableViewCell*)[aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        cell.backgroundView =[[UIImageView alloc] init] ;
		cell.selectedBackgroundView = [[UIImageView alloc] init] ;
        
	}
    
    if (indexPath.section==0 && indexPath.row==0)
    {
        
        
        cell.img_logo.image = [UIImage imageNamed:_ComanyLogo];
        cell.lbl_Title.text = @"Company";
        cell.lbl_SubTitle.text = _ComapnySubtitle;
        cell.lbl_Version.text = @"";

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
    }
    
    else if (indexPath.section==0 && indexPath.row==1)
    {
        
        cell.img_logo.image = [UIImage imageNamed:@"more apps"];
        cell.lbl_Title.text = @"More Apps";
        cell.lbl_SubTitle.text = @"Our Company Applications";
        cell.lbl_Version.text = @"";
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
    }
    
    if (indexPath.section==1 && indexPath.row==0)
    {
        
        cell.img_logo.image = [UIImage imageNamed:@"send love"];
        cell.lbl_Title.text = @"Send Love";
        cell.lbl_SubTitle.text = @"Love it ? Rate us";
        cell.lbl_Version.text = @"";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
        
    }else if (indexPath.section==1 && indexPath.row==1)
    {
        
        cell.img_logo.image = [UIImage imageNamed:@"write to us"];
        cell.lbl_Title.text = @"Write to us";
        cell.lbl_SubTitle.text = @"Feedback are highly appreciated";
        cell.lbl_Version.text = @"";

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
    }
    
    if (indexPath.section==2 && indexPath.row==0)
    {
        cell.img_logo.image = [UIImage imageNamed:@"facebook"];
        cell.lbl_Title.text = @"Facebook";
        cell.lbl_SubTitle.text = @"Share Socially on Facebook";
        cell.lbl_Version.text = @"";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
       
        
    }else if (indexPath.section==2 && indexPath.row==1)
    {
        cell.img_logo.image = [UIImage imageNamed:@"twitter"];
        cell.lbl_Title.text = @"Twitter";
        cell.lbl_SubTitle.text = @"Tweet it anytime";
        cell.lbl_Version.text = @"";
        
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
        
    }else if (indexPath.section==2 && indexPath.row==2) {
        
        cell.img_logo.image = [UIImage imageNamed:@"email"];
        cell.lbl_Title.text = @"Email";
        cell.lbl_SubTitle.text = @"Mail us directly";
        cell.lbl_Version.text = @"";
       
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
        
    }else if (indexPath.section==2 && indexPath.row==3) {
        
        
        cell.img_logo.image = [UIImage imageNamed:@"text message"];
        cell.lbl_Title.text = @"Text Message";
        cell.lbl_SubTitle.text = @"Send through texts";
        cell.lbl_Version.text = @"";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView=nil;
        
    }
    
    
    if (indexPath.section==3 && indexPath.row==0)
    {
        
        cell.img_logo.image = [UIImage imageNamed:@"version"];
        cell.lbl_Title.text = @"Version";
        cell.lbl_SubTitle.text = @"Letest";
        cell.lbl_Version.text = [self getAppVersion];
       
       cell.accessoryType=UITableViewCellAccessoryNone;
        
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    
	return cell;
}

-(NSString *)getAppVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0 && indexPath.row==0)
    {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        CompanyViewController *company = [[CompanyViewController alloc] initWithNibName:@"CompanyViewController" bundle:nil];
        company.CompanyUrl = _ComapnyUrl;
        company.CompanyTitle = _ComapnySubtitle;
        [self.navigationController pushViewController:company animated:YES];
        
        

    }else if (indexPath.section==0 && indexPath.row==1)
    {
        [self showMyApps];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    
    if (indexPath.section==2 && indexPath.row==2)
    {
        
        NSData* myData = UIImageJPEGRepresentation([UIImage imageNamed:@"Gluten_emailmarketing.png"], 1.0);
        [self MailSendSubject:_prodName Recipients:nil Message:_MarketingContent ImageData:myData ];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if (indexPath.section==2 && indexPath.row==3)
    {
        [self iMessageMessage:_MarketingContent];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if (indexPath.section==2 && indexPath.row==1)
    {
        
        BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]];
        if (isInstalled) {
        
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet addURL:[NSURL URLWithString:_AppRedirectUrl]];
            [tweetSheet setInitialText:_MarketingContent];
            [self presentViewController:tweetSheet animated:YES completion:nil];
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
        }else {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                                     message:@"Device does not have any configured Twitter account"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Close"
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil];
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
        
        
        
    }
    else if (indexPath.section==2 && indexPath.row==0)
    {
        
        BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]];
        
        if (isInstalled) {
            
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [controller addURL:[NSURL URLWithString:_AppRedirectUrl]];
            [controller setInitialText:_MarketingContent];
            [self presentViewController:controller animated:YES completion:Nil];
            
        } else {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                                     message:@"Device does not have any configured Facebook account"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Close"
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil];
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        
        
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    
    if (indexPath.section==3 && indexPath.row==0)
    {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    
    if (indexPath.section==1 && indexPath.row==0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_AppRedirectUrl] options:@{} completionHandler:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }else if (indexPath.section==1 && indexPath.row==1)
    {
        NSString *deviceInfo=[NSString stringWithFormat:@"</br></br></br></br></br></br>Product: %@ \r</br> Device: %@ \r</br> Model: %@ \r</br> iOS Version: %@",_prodName,[UIDevice currentDevice].name,[UIDevice currentDevice].model,[UIDevice currentDevice].systemVersion] ;
        
        [self MailSendSubject:_EmailSubject Recipients:@"feedback@pixsterstudio.com" Message:deviceInfo ImageData:nil ];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //Paleo smoothie
    }
    
    
}
- (void)viewDidUnload {
//    [self setLblNvaTitle:nil];
    [super viewDidUnload];
}

- (void)MailSendSubject:(NSString*)subject Recipients:(NSString*)recipients Message:(NSString*)message ImageData:(NSData*)imageData
{
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        [mailer setSubject:subject];
        NSArray *toRecipients = [NSArray arrayWithObjects:recipients, nil];
        [mailer setToRecipients:toRecipients];
        
        if (imageData != nil) {
            [mailer addAttachmentData:imageData mimeType:@"image/jpeg" fileName:@"Image"];
        }
        
        
        [mailer setMessageBody:message isHTML:YES];
        [self presentViewController:mailer animated:YES completion:nil];
        
        
    }
    else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                                 message:@"Device does not have any configured mail account"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Close"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Mail saved: you saved the email message in the Drafts folder");
			break;
		case MFMailComposeResultSent:
			NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send the next time the user connects to email");
			break;
		case MFMailComposeResultFailed:
			NSLog(@"Mail failed: the email message was nog saved or queued, possibly due to an error");
			break;
		default:
			NSLog(@"Mail not sent");
			break;
	}
    
	 [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) iMessageMessage:(NSString*)msg
{
	MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = msg;
		controller.recipients = [NSArray arrayWithObjects: nil];
		controller.messageComposeDelegate = self;
        [self resignFirstResponder];
		[self presentViewController:controller animated:YES completion:nil];
        
	}
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
             [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case MessageComposeResultFailed:
            NSLog(@"Failed");
            break;
        case MessageComposeResultSent:
            NSLog(@"Sent");
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showMyApps
{
    
    DAAppsViewController *appsViewController = [[DAAppsViewController alloc] init];

    NSInteger number =  _AppsId;

    [appsViewController loadAppsWithArtistId:number completionBlock:nil];

    [self.navigationController pushViewController:appsViewController animated:YES];
    
}

@end







