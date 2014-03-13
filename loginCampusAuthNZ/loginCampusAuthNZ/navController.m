//
//  navController.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/02/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "navController.h"

@interface navController ()

@end

@implementation navController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Aixo fa que les lletres de la barra en la que posa l'hora, bateria i covertura siguin de color clar. Els canvis visuals van amb unes modificacions en l'AppDelegate
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
