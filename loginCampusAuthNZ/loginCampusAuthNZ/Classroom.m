//
//  Classroom.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Classroom.h"

@implementation Classroom

- (void) setDatos:(NSDictionary *)classroomDictionary
{
    self.identifier = [classroomDictionary objectForKey:@"id"];
    self.title = [classroomDictionary objectForKey:@"title"];
    self.color = [classroomDictionary objectForKey:@"color"];
    self.fatherId = [classroomDictionary objectForKey:@"fatherId"];
    self.assignments = [classroomDictionary objectForKey:@"assignments"];
    self.code = [classroomDictionary objectForKey:@"code"];
    self.shortTitle = [classroomDictionary objectForKey:@"shortTitle"];
}

/**
 * Get classroom's data.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param iden Clasroom's identifier.
 * @param token the token obtained with the autentication
 * @return Classroom object with classrooms's data.
 */
- (Classroom *) getClassroomsId:(NSString *)iden withToken:(NSString *)token
{
    Classroom *c = [[Classroom alloc] init];
    
    NSURL *classroomURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *classroomData = [NSData dataWithContentsOfURL:classroomURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:classroomData encoding:NSUTF8StringEncoding]);
    NSDictionary *classroomDict = [NSJSONSerialization JSONObjectWithData:classroomData options:0 error:nil];
    
    if ([classroomDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [classroomDict valueForKey:@"error"], [classroomDict valueForKey:@"error_description"]);
        return c;
    }
    
    [c setDatos:classroomDict];
    
    return c;
}


@end
