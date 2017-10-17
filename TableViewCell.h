//
//  TableViewCell.h
//  PaleoSmoothi
//
//  Created by Pixster Macmini2 on 16/10/17.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_logo;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_SubTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Version;

@end
