//
//  loginViewController.h
//  loginCampusAuthNZ
//
//  Created by UOC on 14/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "webController.h"
#import "authObj.h"
#import "Constants.h"
#import "NextViewController.h"
#import <Security/Security.h>
#import "PDKeychainBindings.h"

@interface loginViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *loginButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loading;
@property (nonatomic, retain) webController *viewController;
@property (nonatomic, strong) authObj *auth;

-(IBAction)login;
-(IBAction)esborra;


@end
