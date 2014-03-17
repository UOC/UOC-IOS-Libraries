//
//  NextViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 27/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//



// Canviar aquest controlador pel primer controlador de la seva app
#import <UIKit/UIKit.h>
#import "authObj.h"
#import "Constants.h"
#import "UserGetViewController.h"
#import "MailMessagesTableViewController.h"
#import "CalendarEventsPostTableViewController.h"
#import "MobileResourcesTableViewController.h"

@interface NextViewController : UIViewController

@property (nonatomic, strong) authObj *auth;
@property (nonatomic, strong) IBOutlet UILabel *tokenActual;

@property (nonatomic, strong) IBOutlet UIButton *gotoUserGet;
@property (nonatomic, strong) IBOutlet UIButton *gotoMailMessagesGet;
@property (nonatomic, strong) IBOutlet UIButton *gotoCalendarEventsPost;
@property (nonatomic, strong) IBOutlet UIButton *gotoMobileResourcesGet;
- (void) mostraAccessToken;

- (IBAction)anarUserGet;
- (IBAction)anarMailMessagesGet;
- (IBAction)anarCalendarEventsPost;
- (IBAction)anarMobileResourcesGet;
@end
