//
//  Person.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) setDatos:(NSDictionary *)personDictionary
{
    self.profiles = [[NSMutableArray alloc] init];
    
    self.identifier = [personDictionary objectForKey:@"id"];
    self.username = [personDictionary objectForKey:@"username"];
    self.name = [personDictionary objectForKey:@"name"];
    self.surname1 = [personDictionary objectForKey:@"surname1"];
    self.surname2 = [personDictionary objectForKey:@"surname2"];
    self.email = [personDictionary objectForKey:@"email"];
    for (NSDictionary *profile in [personDictionary objectForKey:@"profiles"]){
        Profile *p = [[Profile alloc] init];
        [p setDatos:profile];
        [self.profiles addObject:p];
    }
    self.userNumber = [personDictionary objectForKey:@"userNumber"];
    self.hobbies = [personDictionary objectForKey:@"hobbies"];
    self.skills = [personDictionary objectForKey:@"skills"];
    self.about = [personDictionary objectForKey:@"about"];
    self.NGOes = [personDictionary objectForKey:@"NGOes"];
    self.languages = [personDictionary objectForKey:@"languages"];
    self.secondaryEmail = [personDictionary objectForKey:@"secondaryEmail"];
    self.blog = [personDictionary objectForKey:@"blog"];
    self.personalSite = [personDictionary objectForKey:@"personalSite"];
    NSNumber *lastUpNum = [personDictionary objectForKey:@"lastUpdate"];
    self.lastUpdate = [NSDate dateWithTimeIntervalSince1970:(([lastUpNum longLongValue]/ 1000)+7200)];
}


/**
 * Get the public data of one person.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param iden Person identifier.
 * @param token the token obtained with the autentication
 * @return Person object with the person
 */
-(Person *) getPeopleId:(NSString *)iden withToken:(NSString *)token
{
    Person *p = [[Person alloc] init];
    
    NSURL *personURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *personData = [NSData dataWithContentsOfURL:personURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:personData encoding:NSUTF8StringEncoding]);
    NSDictionary *personDict = [NSJSONSerialization JSONObjectWithData:personData options:0 error:nil];
    
    if ([personDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [personDict valueForKey:@"error"], [personDict valueForKey:@"error_description"]);
        return p;
    }
    
    [p setDatos:personDict];
    
    return p;
}

@end
