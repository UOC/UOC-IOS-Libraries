//
//  MobileResourcesTableViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 17/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileResourceList.h"
#import "MobileResource.h"
#import "authObj.h"


@interface MobileResourcesTableViewController : UITableViewController

@property (nonatomic, retain) authObj *auth;
@property (nonatomic, retain) NSMutableArray *resources;


- (void)carregarResources;
@end
