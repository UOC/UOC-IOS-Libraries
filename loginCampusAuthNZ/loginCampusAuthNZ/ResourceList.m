//
//  ResourceList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ResourceList.h"

@implementation ResourceList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *resource in [dict objectForKey:@"resources"]) {
        Resource *r = [[Resource alloc] init];
        [r setDatos:resource];
        [self.resources addObject:r];
    }
}


/**
 * Get the resource's list of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Clasroom's identifier
 * @param token the token obtained with the autentication
 * @return Array with the list of resources of the classroom.
 */
- (NSMutableArray *) getClassroomsIdResources:(NSString *)idenC withToken:(NSString *)token
{
    self.resources = [[NSMutableArray alloc] init];
    
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/resources?access_token=%@", baseUrl, idenC, token]];
    
    NSData *resourcesData = [NSData dataWithContentsOfURL:resourcesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourcesData encoding:NSUTF8StringEncoding]);
    NSDictionary *resourcesDict = [NSJSONSerialization JSONObjectWithData:resourcesData options:0 error:nil];
    
    if ([resourcesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [resourcesDict valueForKey:@"error"], [resourcesDict valueForKey:@"error_description"]);
        return self.resources;
    }
    
    [self setDatos:resourcesDict];
    
    return self.resources;
}


/**
 * Get the resource's list of the subject.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenS Subject's identifier
 * @param token the token obtained with the autentication
 * @return Array with the list of resources of the subject.
 */
- (NSMutableArray *) getSubjectsIdResources:(NSString *)idenS withToken:(NSString *)token
{
    self.resources = [[NSMutableArray alloc] init];
    
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/resources?access_token=%@", baseUrl, idenS, token]];
    
    NSData *resourcesData = [NSData dataWithContentsOfURL:resourcesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:resourcesData encoding:NSUTF8StringEncoding]);
    NSDictionary *resourcesDict = [NSJSONSerialization JSONObjectWithData:resourcesData options:0 error:nil];
    
    if ([resourcesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [resourcesDict valueForKey:@"error"], [resourcesDict valueForKey:@"error_description"]);
        return self.resources;
    }
    
    [self setDatos:resourcesDict];
    
    return self.resources;
}

@end
