//
//  MailMessagesTableViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 13/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "authObj.h"
#import "MessageList.h"
#import "Message.h"

@interface MailMessagesTableViewController : UITableViewController

@property (nonatomic,retain) authObj *auth;
@property (nonatomic, retain) NSMutableArray *messages;

- (void)cargarMessages;


@end
