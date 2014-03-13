//
//  SubjectList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "SubjectList.h"

@implementation SubjectList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *subject in [dict objectForKey:@"subjects"]) {
        Subject *s = [[Subject alloc] init];
        [s setDatos:subject];
        [self.subjects addObject:s];
    }
}


/**
 * Get the subjects which the user that is using the application is enrolled in.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with the list of subjects the user is enrolled in.
 */
- (NSMutableArray *) getSubjects:(NSString *)token
{
    self.subjects = [[NSMutableArray alloc] init];
    
    NSURL *subjectsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects?access_token=%@", baseUrl, token]];
    
    NSData *subjectsData = [NSData dataWithContentsOfURL:subjectsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:subjectsData encoding:NSUTF8StringEncoding]);
    NSDictionary *subjectsDict = [NSJSONSerialization JSONObjectWithData:subjectsData options:0 error:nil];
    
    if ([subjectsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [subjectsDict valueForKey:@"error"], [subjectsDict valueForKey:@"error_description"]);
        return self.subjects;
    }
    
    [self setDatos:subjectsDict];
    
    return self.subjects;
}

@end
