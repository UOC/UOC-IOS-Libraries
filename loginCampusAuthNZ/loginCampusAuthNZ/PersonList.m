//
//  PersonList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "PersonList.h"

@implementation PersonList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *persona in [dict objectForKey:@"people"]) {
        Person *p = [[Person alloc] init];
        [p setDatos:persona];
        [self.people addObject:p];
    }
}


/**
 * Search users.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with the users that match the search criteria.
 */
- (NSMutableArray *) getPeople:(NSString *)token
{
    self.people = [[NSMutableArray alloc] init];
    
    NSURL *peopleURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people?access_token=%@", baseUrl, token]];
    
    NSData *peopleData = [NSData dataWithContentsOfURL:peopleURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:peopleData encoding:NSUTF8StringEncoding]);
    NSDictionary *peopleDict = [NSJSONSerialization JSONObjectWithData:peopleData options:0 error:nil];
    
    if ([peopleDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [peopleDict valueForKey:@"error"], [peopleDict valueForKey:@"error_description"]);
        return self.people;
    }
    
    [self setDatos:peopleDict];
    
    return self.people;
}




@end
