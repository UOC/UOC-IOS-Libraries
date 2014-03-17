//
//  CalendarEventsPostTableViewController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "CalendarEventsPostTableViewController.h"

@interface CalendarEventsPostTableViewController ()

@end

@implementation CalendarEventsPostTableViewController

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
    
    self.events = [[NSMutableArray alloc] init];
    [self cargarEventos];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el evento correspondiente al numero de celda
    Event *evento = [self.events objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:evento.summary];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)cargarEventos
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        
        if([self.auth shouldRefreshToken]) [self.auth refreshAccessToken]; // comprovem que el token no s'hagi caducat

        self.events = [[EventList alloc] getCalendarEvents:self.auth.accessToken];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

- (void)setDatos:(NSDictionary *)dict
{
    [self.events removeAllObjects];
    for (NSDictionary *evento in [dict objectForKey:@"events"]) {
        Event *e = [[Event alloc] init];
        [e setDatos:evento];
        [self.events addObject:e];
    }
}

- (IBAction)crearEvent
{
    // Es pot fer que l'usuari sigui qui introdueix les dades.
    Event *e1 = [[Event alloc] init];
    e1.identifier = @"10";
    e1.url = @"La URL";
    e1.summary = @"El SUMMARY";
    e1.start = [NSDate date];
    e1.end = [NSDate dateWithTimeIntervalSinceNow:44200]; // En 12 hores acaba
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // Exemple utilitzant la llibreria
    dispatch_async(backgroundQueue, ^{
        
        if([self.auth shouldRefreshToken]) [self.auth refreshAccessToken]; // comprovem que el token no s'hagi caducat
        
        Event *e = [[Event alloc] postCalendarEvents:e1 withToken:self.auth.accessToken];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (e.identifier != nil){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event Creat"
                                                            message:[NSString stringWithFormat:@"id: %@",e.identifier]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
                [alert show];
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"no s'ha pogut crear l'event"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            [self cargarEventos];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
    
}

@end
