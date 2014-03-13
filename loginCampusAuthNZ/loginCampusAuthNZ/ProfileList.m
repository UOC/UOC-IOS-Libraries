//
//  ProfileList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ProfileList.h"

@implementation ProfileList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *profile in [dict objectForKey:@"profiles"]) {
        Profile *p = [[Profile alloc] init];
        [p setDatos:profile];
        [self.profiles addObject:p];
    }
}


/**
 * Get the profiles of the person.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenP Person identifier.
 * @param token the token obtained with the autentication
 * @return Array with the profiles of the person.
 */
- (NSMutableArray *) getPeopleIdProfiles:(NSString *)idenP withToken:(NSString *)token
{
    self.profiles = [[NSMutableArray alloc] init];
    
    NSURL *profilesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people/%@/profiles?access_token=%@", baseUrl, idenP, token]];
    
    NSData *profilesData = [NSData dataWithContentsOfURL:profilesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profilesData encoding:NSUTF8StringEncoding]);
    NSDictionary *profilesDict = [NSJSONSerialization JSONObjectWithData:profilesData options:0 error:nil];
    
    if ([profilesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profilesDict valueForKey:@"error"], [profilesDict valueForKey:@"error_description"]);
        return self.profiles;
    }
    
    [self setDatos:profilesDict];
    
    return self.profiles;
}


/**
 * Get the profiles of the user that is using the application.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with user's profiles.
 */
- (NSMutableArray *) getUserProfiles:(NSString *)token
{
    self.profiles = [[NSMutableArray alloc] init];
    
    NSURL *profilesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/profiles?access_token=%@", baseUrl, token]];
    
    NSData *profilesData = [NSData dataWithContentsOfURL:profilesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profilesData encoding:NSUTF8StringEncoding]);
    NSDictionary *profilesDict = [NSJSONSerialization JSONObjectWithData:profilesData options:0 error:nil];
    
    if ([profilesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profilesDict valueForKey:@"error"], [profilesDict valueForKey:@"error_description"]);
        return self.profiles;
    }
    
    [self setDatos:profilesDict];
    
    return self.profiles;
}

@end
