//
//  User.m
//  Llibreria
//
//  Created by UOC on 17/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "User.h"

@implementation User


- (void) setDatos:(NSDictionary *)userDictionary
{
    self.identifier  = [userDictionary objectForKey:@"id"];
    self.username    = [userDictionary objectForKey:@"username"];
    self.name        = [userDictionary objectForKey:@"name"];
    self.number      = [userDictionary objectForKey:@"number"];
    self.fullname    = [userDictionary objectForKey:@"fullName"];
    self.language    = [userDictionary objectForKey:@"language"];
    self.sessionID   = [userDictionary objectForKey:@"sessionId"];
    self.email       = [userDictionary objectForKey:@"email"];
    self.photoUrl    = [userDictionary objectForKey:@"photoUrl"];
    
    NSURL *photoURL     = [NSURL URLWithString:[userDictionary objectForKey:@"photoUrl"]];
    NSData *photoData   = [NSData dataWithContentsOfURL:photoURL];
    self.photo          = [UIImage imageWithData:photoData];
}


/**
 * Get personal data about the user (the user that is using the application).
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return User object with user's data.
 */
-(User *) getUser:(NSString *) token{
    User *u = [[User alloc] init];
    NSURL *userURL = [NSURL URLWithString:
                      [NSString stringWithFormat:
                       @"%@user?access_token=%@", baseUrl ,token]];
    
    
    NSData *userData = [NSData dataWithContentsOfURL:userURL];
        
    NSLog(@"userData - %@",[[NSString alloc]initWithData:userData encoding:NSUTF8StringEncoding]);
    // Los datos que recibimos los parseamos a una estructura mas manejable como por ejemplo NSDictionary
    NSDictionary *userDict = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        
    if ([userDict valueForKey:@"error"]) {
        NSLog(@"%@: %@",[userDict valueForKey:@"error"],[userDict valueForKey:@"error_description"]);
        return u;
    }
        
    // Los datos recibidos los pasamos al modelo
    [u setDatos:userDict];
       
    return u;
}

@end