//
//  BMWNetworkController.h
//  GithubToGo
//
//  Created by Chad D Colby on 1/27/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMWNetworkController : NSObject

+ (BMWNetworkController *)sharedController;

- (NSArray *)reposArrayFromSearch:(NSString *)stringToSearch;

@end
