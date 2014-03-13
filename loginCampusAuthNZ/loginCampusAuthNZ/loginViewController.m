//
//  loginViewController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "loginViewController.h"
#import "webController.h"

@interface loginViewController ()

@end

@implementation loginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.auth = [[authObj alloc]init];
    NSLog(@"viewDidLoad");
    [self.loading setHidden:TRUE];
    //NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    //[stdDefaults removeObjectForKey:@"firstLogin"];
    //[stdDefaults removeObjectForKey:@"registrada"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) borraVariables
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    [stdDefaults removeObjectForKey:@"registrada"];
    [stdDefaults removeObjectForKey:@"access_token"];
    [stdDefaults removeObjectForKey:@"secret"];
    [stdDefaults removeObjectForKey:@"nextView"];
    [stdDefaults removeObjectForKey:@"client"];
    [stdDefaults removeObjectForKey:@"refresh_token"];
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        NSLog(@"Cookie - %@", cookie);
        [storage deleteCookie:cookie];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];

}

-(void) viewDidAppear:(BOOL)animated
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if([stdDefaults objectForKey:@"nextView"]==FALSE){
        if([stdDefaults objectForKey:@"registrada"]){
            if([stdDefaults objectForKey:@"secret"]==FALSE){
                NSLog(@"URL - %@", [NSString stringWithFormat:@"%@?access_token=%@",urlApp, [stdDefaults objectForKey:@"access_token"]]);
                [self.loading startAnimating];
                [self.loading setHidden:FALSE];
                [self.loginButton setEnabled:FALSE];
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSDictionary *oAuth = [NSJSONSerialization JSONObjectWithData:self.viewController.receivedData options:0 error:nil];
                    [self.auth setAuth:oAuth];
                    
                    NSURL *obtenirCredencials =[NSURL URLWithString:[NSString stringWithFormat:@"%@?access_token=%@", urlApp, [stdDefaults objectForKey:@"access_token"]]];
                    
                    NSData *credencials = [NSData dataWithContentsOfURL:obtenirCredencials];
                    
                    NSDictionary *credencialsDict = [NSJSONSerialization JSONObjectWithData:credencials options:0 error:nil];
                    
                    [stdDefaults setValue:[credencialsDict objectForKey:@"name"] forKey:@"access_token"];
                    [stdDefaults setValue:[credencialsDict objectForKey:@"secret"] forKey:@"secret"];
                    [stdDefaults setValue:[credencialsDict objectForKey:@"client"] forKey:@"client"];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [self.loginButton setEnabled:TRUE];
                        [self.loading stopAnimating];
                        [self.loading setHidden:TRUE];
                        [self goToNextView];
                        
                        NSLog(@"credencials - %@", [[NSString alloc] initWithData:credencials encoding:NSUTF8StringEncoding]);
                    });
                });
                
                
            }
            else{
                NSLog(@"Secret Cert");
            }
        }
    }
    else
    {
        NSDictionary *oAuth = [NSJSONSerialization JSONObjectWithData:self.viewController.receivedData options:0 error:nil];
        [self.auth setAuth:oAuth];
        [self goToNextView];
    }
}


-(void) goToNextView
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    [stdDefaults removeObjectForKey:@"nextView"];
     // Canviar aquest controlador pel primer controlador de la seva app
    NextViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"nextView"];
    nextView.auth = self.auth;
    [self.navigationController pushViewController:nextView animated:YES];
}


- (IBAction) esborra{
    [self borraVariables];
}

- (IBAction) login
{
    [self ferLogin];
}

- (void) ferLogin
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if([stdDefaults objectForKey:@"registrada"]==FALSE){
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.viewController = [[webController alloc] initWithNibName:@"ipadWebLogin" bundle:nil];
            self.viewController.extra = [[NSString stringWithFormat:@"device=%@&", [[UIDevice currentDevice] name]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            [[self navigationController] pushViewController:self.viewController animated:YES];
        }
        else {
            self.viewController = [[webController alloc] initWithNibName:@"webController" bundle:nil];
            self.viewController.extra = [[NSString stringWithFormat:@"device=%@&", [[UIDevice currentDevice] name]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            [[self navigationController] pushViewController:self.viewController animated:YES];
        }
        NSLog(@"Anar a registrar l'app");
    }
    else{
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            self.auth.refreshToken = [stdDefaults objectForKey:@"refresh_token"];
            [self.auth refreshAccessToken];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                if(self.auth.accessToken != nil) [self goToNextView];
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LOGIN ERROR"
                                                                    message:@"You need internet connection."
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                }
            });
        });
        
        /*
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.viewController = [[webController alloc] initWithNibName:@"ipadWebLogin" bundle:nil];
            self.viewController.extra = [[NSString stringWithFormat:@"device=%@&", [[UIDevice currentDevice] name]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            [[self navigationController] pushViewController:self.viewController animated:YES];
        }
        else {
            self.viewController = [[webController alloc] initWithNibName:@"webController" bundle:nil];
            self.viewController.extra = [[NSString stringWithFormat:@"device=%@&", [[UIDevice currentDevice] name]] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            [[self navigationController] pushViewController:self.viewController animated:YES];
        }
         */
    }
}

@end
