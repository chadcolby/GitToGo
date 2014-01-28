//
//  BMWMasterViewController.m
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "BMWMasterViewController.h"
#import "BMWNetworkController.h"
#import "BMWDetailViewController.h"

@interface BMWMasterViewController () {
    NSMutableArray *_objects;
}

@property (nonatomic, strong) NSArray *searchResultsArray;
@property (nonatomic, strong) NSDictionary *repoDictionary;
@property (nonatomic, strong) NSString *enteredSearchString;

@end

@implementation BMWMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (BMWDetailViewController *)[[self.splitViewController.viewControllers lastObject]
                                                            topViewController];
    //self.searchResultsArray = [[BMWNetworkController sharedController] reposArrayFromSearch:@"iOS"];
    self.repoDictionary = [[NSDictionary alloc] init];
    self.enteredSearchString = [[NSString alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResultsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.repoDictionary = [self.searchResultsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.repoDictionary objectForKey:@"name"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.repoDictionary = self.searchResultsArray[indexPath.row];
        self.detailViewController.detailItem = self.repoDictionary;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

- (IBAction)searchButton:(id)sender {
    self.enteredSearchString = self.searchField.text;
    
    self.searchResultsArray = [[BMWNetworkController sharedController] reposArrayFromSearch:self.enteredSearchString];
    [self.searchField resignFirstResponder];

    
    [self.tableView reloadData];
}

@end
