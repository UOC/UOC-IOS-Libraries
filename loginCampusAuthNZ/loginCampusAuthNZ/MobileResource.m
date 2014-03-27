//
//  MobileResource.m
//  loginCampusAuthNZ
//
//  Created by UOC on 14/03/14.
//  Copyright (c) 2014 UOC. All rights reserved.
//

#import "MobileResource.h"

@implementation MobileResource

- (void) setDatos:(NSDictionary *)mobileResourcesDictionary
{
    self.ident = [mobileResourcesDictionary objectForKey:@"id"];
    self.type = [mobileResourcesDictionary objectForKey:@"type"];
    self.urlIOS = [mobileResourcesDictionary objectForKey:@"urlIOS"];
    self.urlMarketIOS = [mobileResourcesDictionary objectForKey:@"urlMarketIOS"];
    self.nameIOS = [mobileResourcesDictionary objectForKey:@"nameIOS"];
    self.logoIOS = [mobileResourcesDictionary objectForKey:@"logoIOS"];
    self.descriptionIOS = [mobileResourcesDictionary objectForKey:@"descriptionIOS"];
    self.urlAndroid = [mobileResourcesDictionary objectForKey:@"urlAndroid"];
    self.urlMarketAndroid = [mobileResourcesDictionary objectForKey:@"urlMarketAndroid"];
    self.nameAndroid = [mobileResourcesDictionary objectForKey:@"nameAndroid"];
    self.logoAndroid = [mobileResourcesDictionary objectForKey:@"logoAndroid"];
    self.descriptionAndroid = [mobileResourcesDictionary objectForKey:@"descriptionAndroid"];
    
    
}



-(MobileResource *) getMobileResourcesId:(NSString *)idenR withToken:(NSString *)token
{
    MobileResource *r = [[MobileResource alloc] init];
    
    NSURL *resourceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mobileresources/%@?access_token=%@", baseUrl ,  idenR, token]];
    
    
    NSData *resourceData = [NSData dataWithContentsOfURL:resourceURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourceData encoding:NSUTF8StringEncoding]);
    if(resourceData != nil){
        NSDictionary *resourceDict = [NSJSONSerialization JSONObjectWithData:resourceData options:0 error:nil];
        
        if ([resourceDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [resourceDict valueForKey:@"error"], [resourceDict valueForKey:@"error_description"]);
            return r;
        }
        
        [r setDatos:resourceDict];
    }
    
    return r;
}


-(MobileResource *) getMobileResourcesByType:(NSString *)type withToken:(NSString *)token
{
    MobileResource *r = [[MobileResource alloc] init];
    
    NSURL *resourceURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mobileresources/bytype/%@?access_token=%@", baseUrl , type, token]];
    
    
    NSData *resourceData = [NSData dataWithContentsOfURL:resourceURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourceData encoding:NSUTF8StringEncoding]);
    if(resourceData != nil){
        NSDictionary *resourceDict = [NSJSONSerialization JSONObjectWithData:resourceData options:0 error:nil];
        
        if ([resourceDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [resourceDict valueForKey:@"error"], [resourceDict valueForKey:@"error_description"]);
            return r;
        }
        
        [r setDatos:resourceDict];
    }
    
    return r;
}

@end
