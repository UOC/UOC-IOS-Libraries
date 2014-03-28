//
//  MobileResourcesTableViewController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 17/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "MobileResourcesTableViewController.h"

@interface MobileResourcesTableViewController ()

@end

@implementation MobileResourcesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.resources = [[NSMutableArray alloc] init];
    [self carregarResources];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.resources count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MobileResource *app = [self.resources objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:app.nameIOS];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    // Mirar si l'app esta instalada. Si esta instalada accedir. Sino instalar
    MobileResource *aux = [self.resources objectAtIndex:indexPath.row];
    NSURL *myURL = [NSURL URLWithString:aux.urlIOS];
    // Comprovem que es pugui obrir l'aplicacio que volem.
    if ([[UIApplication sharedApplication] canOpenURL:myURL] == YES){
        [[UIApplication sharedApplication] openURL:myURL];
    }
    else {
        #if TARGET_IPHONE_SIMULATOR
        
        // Simulator code
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"El Simulator no te store"
                                                        message:[NSString stringWithFormat:@"Ruta que s'obre en dispositiu real:\n%@", aux.urlMarketIOS]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        #else
        NSURL *marketURL = [NSURL URLWithString:aux.urlMarketIOS];
        [[UIApplication sharedApplication] openURL:marketURL];
        #endif
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)carregarResources
{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        //Definim la URL per a obtenir les apps
    
        dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        
        dispatch_async(backgroundQueue, ^{
            
            if([self.auth shouldRefreshToken]) [self.auth refreshAccessToken]; // comprovem que el token no s'hagi caducat
            self.resources = [[MobileResourceList alloc] getMobileResources:self.auth.accessToken];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //La vista nomes es pot modificar en la cua principal
                [self.tableView reloadData];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            });
        });
}


@end
