//
//  Subject.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Subject.h"

@implementation Subject

- (void) setDatos:(NSDictionary *)subjectDictionary
{
    self.identifier = [subjectDictionary objectForKey:@"id"];
    self.title = [subjectDictionary objectForKey:@"title"];
    self.color = [subjectDictionary objectForKey:@"color"];
    self.fatherId = [subjectDictionary objectForKey:@"fatherId"];
    self.assignments = [subjectDictionary objectForKey:@"assignments"];
    self.code = [subjectDictionary objectForKey:@"code"];
    self.shortTitle = [subjectDictionary objectForKey:@"shortTitle"];
}


/**
 * Get subject's data.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param iden Subject's identifier.
 * @param token the token obtained with the autentication
 * @return Subject object with subject's data.
 */
- (Subject *) getSubjectsId:(NSString *)iden withToken:(NSString *)token
{
    Subject *s = [[Subject alloc] init];
    
    NSURL *subjectURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *subjectData = [NSData dataWithContentsOfURL:subjectURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:subjectData encoding:NSUTF8StringEncoding]);
    NSDictionary *subjectDict = [NSJSONSerialization JSONObjectWithData:subjectData options:0 error:nil];
    
    if ([subjectDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [subjectDict valueForKey:@"error"], [subjectDict valueForKey:@"error_description"]);
        return s;
    }
    
    [s setDatos:subjectDict];
    
    return s;
}

@end
