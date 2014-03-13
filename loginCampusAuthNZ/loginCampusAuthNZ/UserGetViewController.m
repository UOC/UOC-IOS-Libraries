//
//  UserGetViewController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 13/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "UserGetViewController.h"

@interface UserGetViewController ()

@end

@implementation UserGetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.user = [[User alloc] init];
    [self cargarUsuario];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cargarUsuario
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    // Exemple utilitzant la llibreria
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue, ^{

        if([self.auth shouldRefreshToken]) [self.auth refreshAccessToken]; // comprovem que el token no s'hagi caducat
        self.user = [[User alloc] getUser:self.auth.accessToken];
        
        //NSLog(@"User: %@", self.user.username);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self mostrarDatosUsuario];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        });
        
    });
}

- (void)mostrarDatosUsuario
{
    //NSLog(@"User: %@", self.user.username);
    self.username.text   = [NSString stringWithFormat:@"username: %@",self.user.username];
    self.name.text       = [NSString stringWithFormat:@"name: %@",self.user.name];
    self.number.text     = [NSString stringWithFormat:@"number: %@",self.user.number];
    self.fullname.text   = [NSString stringWithFormat:@"fullName: %@",self.user.fullname];
    self.email.text      = [NSString stringWithFormat:@"email: %@",self.user.email];
    self.imagenUser.image= self.user.photo;
    self.ident.text = [NSString stringWithFormat:@"id: %@",self.user.identifier];
    self.sessionId.text = [NSString stringWithFormat:@"sessionId: %@",self.user.sessionID];
    self.languages.text = [NSString stringWithFormat:@"language: %@",self.user.language];
}

@end
