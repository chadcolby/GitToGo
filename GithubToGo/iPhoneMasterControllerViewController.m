//
//  iPhoneMasterControllerViewController.m
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "iPhoneMasterControllerViewController.h"
#import "BMWNetworkController.h"

@interface iPhoneMasterControllerViewController ()

@property (nonatomic, strong) NSArray *searchResultsArray;
@property (nonatomic, strong) NSDictionary *repoDictionary;
@property (nonatomic, strong) NSString *enteredSearchString;

@end

@implementation iPhoneMasterControllerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.searchResultsArray = [[NSArray alloc] init];
    self.repoDictionary = [[NSDictionary alloc] init];
    self.enteredSearchString = [[NSString alloc] init];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.searchResultsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    self.repoDictionary = [self.searchResultsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [self.repoDictionary objectForKey:@"name"];
    
    return cell;
}




#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:self.searchResultsArray];
    }
}

- (IBAction)searchButton:(id)sender {
    
    self.enteredSearchString = [self.searchField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [self.searchField resignFirstResponder];
    self.searchResultsArray = [[BMWNetworkController sharedController] reposArrayFromSearch:self.enteredSearchString];
    
    [self.tableView reloadData];
}
@end
