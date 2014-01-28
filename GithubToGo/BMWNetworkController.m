//
//  BMWNetworkController.m
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "BMWNetworkController.h"

@implementation BMWNetworkController

+ (BMWNetworkController *)sharedController
{
        static dispatch_once_t pred;
        static BMWNetworkController *shared = nil;
        
        dispatch_once(&pred, ^{
            shared = [[BMWNetworkController alloc] init];
        });
        return shared;
}


- (NSArray *)reposArrayFromSearch:(NSString *)stringToSearch
{
    stringToSearch = [NSString stringWithFormat:@"https://api.github.com/search/repositories?q=%@", stringToSearch];
    NSURL *searchURL = [NSURL URLWithString:stringToSearch];
    NSData *searchData = [NSData dataWithContentsOfURL:searchURL];
    
    NSError *error;
    NSDictionary *searchDictionary = [NSJSONSerialization JSONObjectWithData:searchData options:NSJSONReadingMutableContainers
                                                                       error:&error];
    
    return searchDictionary[@"items"];
}
@end
