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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) borraVariables
{
    NSLog(@"Esborrar");
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    //NSLog(@"stdDef - %@", [[stdDefaults dictionaryRepresentation] description]);
    [stdDefaults removeObjectForKey:@"registrada"];
    [stdDefaults removeObjectForKey:@"access_token"];
    [stdDefaults removeObjectForKey:@"secret"];
    [stdDefaults removeObjectForKey:@"nextView"];
    [stdDefaults removeObjectForKey:@"client"];
    [stdDefaults removeObjectForKey:@"refresh_token"];
    
    PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];

    [keychainDef removeObjectForKey:@"access_token"];
    [keychainDef removeObjectForKey:@"client"];
    [keychainDef removeObjectForKey:@"refresh_token"];
    [keychainDef removeObjectForKey:@"secret"];
    
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        // NSLog(@"Cookie - %@", cookie);
        [storage deleteCookie:cookie];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.auth = [[authObj alloc]init];

}

-(void) viewDidAppear:(BOOL)animated
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];

    if([stdDefaults objectForKey:@"nextView"]==FALSE){
        if([stdDefaults objectForKey:@"registrada"]){
            if([stdDefaults objectForKey:@"secret"]==FALSE){
                //NSLog(@"URL - %@", [NSString stringWithFormat:@"%@?access_token=%@",urlApp, [stdDefaults objectForKey:@"access_token"]]);
                [self.loading startAnimating];
                [self.loading setHidden:FALSE];
                [self.loginButton setEnabled:FALSE];
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    if(self.viewController.receivedData != nil){
                        NSDictionary *oAuth = [NSJSONSerialization JSONObjectWithData:self.viewController.receivedData options:0 error:nil];
                        [self.auth setAuth:oAuth];
                        
                        NSURL *obtenirCredencials =[NSURL URLWithString:[NSString stringWithFormat:@"%@?access_token=%@", urlApp, [keychainDef objectForKey:@"access_token"]]];
                        
                        NSData *credencials = [NSData dataWithContentsOfURL:obtenirCredencials];
                        
                        NSDictionary *credencialsDict = [NSJSONSerialization JSONObjectWithData:credencials options:0 error:nil];
                        
                        // Afegim marques per saber en quin punt de l'autenticacio estem.
                        [stdDefaults setValue:@"OK" forKey:@"access_token"];
                        [stdDefaults setValue:@"OK" forKey:@"secret"];
                        [stdDefaults setValue:@"OK" forKey:@"client"];
                        
                        // Guardem les dades de forma segura en un clauer (keychain)
                        [keychainDef setObject:[credencialsDict objectForKey:@"name"] forKey:@"access_token"];
                        [keychainDef setObject:[credencialsDict objectForKey:@"secret"] forKey:@"secret"];
                        [keychainDef setObject:[credencialsDict objectForKey:@"client"] forKey:@"client"];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            [self.loginButton setEnabled:TRUE];
                            [self.loading stopAnimating];
                            [self.loading setHidden:TRUE];
                            [self goToNextView];
                            
                            //NSLog(@"credencials - %@", [[NSString alloc] initWithData:credencials encoding:NSUTF8StringEncoding]);
                        });
                    }
                    else {
                        [self borraVariables];
                        dispatch_async(dispatch_get_main_queue(), ^{
                        
                            [self.loginButton setEnabled:TRUE];
                            [self.loading stopAnimating];
                            [self.loading setHidden:TRUE];
                        });
                    }
                });
                
                
            }
            else{
                NSLog(@"Secret Cert");
            }
        }
    }
    else
    {
        // Es fa servir si vols fer sempre l'autenticacio per web.
        if(self.viewController.receivedData != nil){
            NSDictionary *oAuth = [NSJSONSerialization JSONObjectWithData:self.viewController.receivedData options:0 error:nil];
            [self.auth setAuth:oAuth];
            [self goToNextView];
        }
    }
}



// Aquesta es una funcio que cal modificar
-(void) goToNextView
{
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    [stdDefaults removeObjectForKey:@"nextView"];
    // Canvieu aquest controlador pel primer controlador de la vostra app
    NextViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"nextView"];
    // Es important anar passant el authObj ja que aquest conte el token
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
    PDKeychainBindings *keychainDef = [PDKeychainBindings sharedKeychainBindings];
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    if([stdDefaults objectForKey:@"registrada"]==FALSE){
        // Al fer el login donem el nom del dispositiu.
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
        //NSLog(@"Anar a registrar l'app");
    }
    else{
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

        [self.loading startAnimating];
        [self.loading setHidden:FALSE];
        [self.loginButton setEnabled:FALSE];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            self.auth.refreshToken = [keychainDef objectForKey:@"refresh_token"];
            [self.auth refreshAccessToken];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.loginButton setEnabled:TRUE];
                [self.loading stopAnimating];
                [self.loading setHidden:TRUE];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                if(self.auth.accessToken != nil) [self goToNextView];
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LOGIN ERROR"
                                                                    message:@"You need internet connection.\nIf you have internet connection, you should Log Out."
                                                                   delegate:self
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
                    [alert show];
                }
            });
        });
        
    }
}

@end
