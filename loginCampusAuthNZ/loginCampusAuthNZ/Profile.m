//
//  Profile.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(void) setDatos:(NSDictionary *)profileDictionary
{
    self.appId = [profileDictionary objectForKey:@"appId"];
    self.app = [profileDictionary objectForKey:@"app"];
    self.identifier = [profileDictionary objectForKey:@"id"];
    self.userSubtypeId = [profileDictionary objectForKey:@"userSubtypeId"];
    self.userType = [profileDictionary objectForKey:@"userType"];
    self.usertypeId = [profileDictionary objectForKey:@"usertypeId"];
    self.userSubtype = [profileDictionary objectForKey:@"userSubtype"];
    self.language = [profileDictionary objectForKey:@"language"];
}


/**
 * Get the current profile of the person
 * The user must have given the application the grant READ to use these operation.
 *
 * @param iden Person identifier.
 * @param token the token obtained with the autentication
 * @return Profile object with the current profile of the person.
 */
-(Profile *) getPeopleIdProfilesCurrent:(NSString *)iden withToken:(NSString *)token
{
    Profile *p = [[Profile alloc] init];
    
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people/%@/profiles/current?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *profileData = [NSData dataWithContentsOfURL:profileURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profileData encoding:NSUTF8StringEncoding]);
    NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:profileData options:0 error:nil];
    
    if ([profileDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profileDict valueForKey:@"error"], [profileDict valueForKey:@"error_description"]);
        return p;
    }
    
    [p setDatos:profileDict];
    
    return p;
}


/**
 * Get the current profile of the user that is using the application
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Profile object with the current profile of the user.
 */
-(Profile *) getUserProfilesCurrent:(NSString *)token
{
    Profile *p = [[Profile alloc] init];
    
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/profiles/current?access_token=%@", baseUrl, token]];
    
    
    NSData *profileData = [NSData dataWithContentsOfURL:profileURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profileData encoding:NSUTF8StringEncoding]);
    NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:profileData options:0 error:nil];
    
    if ([profileDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profileDict valueForKey:@"error"], [profileDict valueForKey:@"error_description"]);
        return p;
    }
    
    [p setDatos:profileDict];
    
    return p;
}


/**
 * Update the ccurrent profile of the user that is using the application
 * The user must have given the application the grant WRITE to use these operation.
 *
 * @param putProfile New profile.
 * @param token the token obtained with the autentication
 * @return Profile object with the current profile of the user.
 */
-(Profile *) putUserProfilesCurrent:(Profile *)putProfile withToken:(NSString *)token
{
    //Agafem el perfil que se'ns ha passat i el posem en un diccionari
    NSDictionary *nouProfile = @{@"appId":putProfile.appId, @"app":putProfile.app, @"id":putProfile.identifier, @"userSubtypeId":putProfile.userSubtypeId, @"userType":putProfile.userType, @"usertypeId":putProfile.usertypeId, @"userSubtype":putProfile.userSubtype, @"language":putProfile.language};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouProfile options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/profiles/current?access_token=%@", baseUrl, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileURL];
    
    //Indiquem que el tipus d'accio que voldrem fer sera un POST
    [request setHTTPMethod:@"PUT"];
    //El format de les dades estara en json.
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    Profile *p = [[Profile alloc] init];
    NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([profileDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profileDict valueForKey:@"error"], [profileDict valueForKey:@"error_description"]);
        return p;
    }
    
    // Afegim els valors que ens ha tornat en un perfil que retornem.
    [p setDatos:profileDict];
    return p;
}
@end
