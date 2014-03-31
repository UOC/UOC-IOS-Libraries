//
//  CalendarEventsPostTableViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "authObj.h"
#import "Constants.h"
#import "EventList.h"
#import "Event.h"

@interface CalendarEventsPostTableViewController : UITableViewController

@property (nonatomic, retain) authObj *auth;
@property (nonatomic, retain) NSMutableArray *events;
//@property (nonatomic, assign) BOOL isLoad;

- (void)cargarEventos;

- (IBAction)crearEvent;


@end
