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
    self.url_ios = [mobileResourcesDictionary objectForKey:@"urlIOS"];
    self.url_market_ios = [mobileResourcesDictionary objectForKey:@"urlMarketIOS"];
    self.name_ios = [mobileResourcesDictionary objectForKey:@"nameIOS"];
    self.logo_ios = [mobileResourcesDictionary objectForKey:@"logoIOS"];
    self.info_ios = [mobileResourcesDictionary objectForKey:@"descriptionIOS"];
    self.url_android = [mobileResourcesDictionary objectForKey:@"urlAndroid"];
    self.url_market_android = [mobileResourcesDictionary objectForKey:@"urlMarketAndroid"];
    self.name_android = [mobileResourcesDictionary objectForKey:@"nameAndroid"];
    self.logo_android = [mobileResourcesDictionary objectForKey:@"logoAndroid"];
    self.info_android = [mobileResourcesDictionary objectForKey:@"descriptionAndroid"];
    
    
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
