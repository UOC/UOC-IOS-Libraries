//
//  UserGetViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 13/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "authObj.h"

@interface UserGetViewController : UIViewController

@property (nonatomic, retain) authObj *auth;
@property (nonatomic, strong) User *user;

@property (weak, nonatomic) IBOutlet UIImageView *imagenUser;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *fullname;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *ident;
@property (weak, nonatomic) IBOutlet UILabel *languages;
@property (weak, nonatomic) IBOutlet UILabel *sessionId;


@end
