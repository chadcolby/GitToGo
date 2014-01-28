//
//  BMWMasterViewController.h
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMWDetailViewController;

@interface BMWMasterViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) BMWDetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

- (IBAction)searchButton:(id)sender;


@end
