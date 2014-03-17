//
//  NextViewController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 27/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//




// Canviar aquest controlador pel primer controlador de la seva app

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self mostraAccessToken];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) mostraAccessToken
{
    [self.tokenActual setText:[NSString stringWithFormat:@"access_token = %@",self.auth.accessToken]];
}

- (IBAction)anarUserGet
{
    UserGetViewController *usViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"userGet"];
    usViewController.auth = self.auth;
    [self.navigationController pushViewController:usViewController animated:NO];
}

- (IBAction)anarMailMessagesGet
{
    MailMessagesTableViewController *maTViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"mailMessages"];
    maTViewController.auth = self.auth;
    [self.navigationController pushViewController:maTViewController animated:NO];
}

- (IBAction)anarCalendarEventsPost
{
    CalendarEventsPostTableViewController *ceTViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"calendarEvents"];
    ceTViewController.auth = self.auth;
    [self.navigationController pushViewController:ceTViewController animated:NO];
}


- (IBAction)anarMobileResourcesGet
{
    MobileResourcesTableViewController *mrTViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"mobileResources"];
    mrTViewController.auth = self.auth;
    [self.navigationController pushViewController:mrTViewController animated:NO];
}

@end
