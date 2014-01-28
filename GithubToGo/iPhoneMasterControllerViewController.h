//
//  iPhoneMasterControllerViewController.h
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMWDetailViewController.h"

@interface iPhoneMasterControllerViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) BMWDetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

- (IBAction)searchButton:(id)sender;

@end
