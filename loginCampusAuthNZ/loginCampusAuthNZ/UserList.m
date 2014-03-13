//
//  UserList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "UserList.h"

@implementation UserList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *user in [dict objectForKey:@"users"]) {
        User *u = [[User alloc] init];
        [u setDatos:user];
        [self.users addObject:u];
    }
}


/**
 * Get the list of members of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Classroom's identifier
 * @param token the token obtained with the autentication
 * @return Array with the list of members of the classroom.
 */
- (NSMutableArray *) getClassroomsIdPeople:(NSString *)idenC withToken:(NSString *)token
{
    self.users = [[NSMutableArray alloc] init];
    
    NSURL *usersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/people?access_token=%@", baseUrl, idenC, token]];
    
    NSData *usersData = [NSData dataWithContentsOfURL:usersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:usersData encoding:NSUTF8StringEncoding]);
    NSDictionary *usersDict = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    
    if ([usersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [usersDict valueForKey:@"error"], [usersDict valueForKey:@"error_description"]);
        return self.users;
    }
    
    [self setDatos:usersDict];
    
    return self.users;
}


/**
 * Get the list of students of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Classroom's identifier
 * @param token the token obtained with the autentication
 * @return Array with all the students of the classroom.
 */
- (NSMutableArray *) getClassroomsIdPeopleStudents:(NSString *)idenC withToken:(NSString *)token
{
    self.users = [[NSMutableArray alloc] init];
    
    NSURL *usersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/people/students?access_token=%@", baseUrl, idenC, token]];
    
    NSData *usersData = [NSData dataWithContentsOfURL:usersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:usersData encoding:NSUTF8StringEncoding]);
    NSDictionary *usersDict = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    
    if ([usersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [usersDict valueForKey:@"error"], [usersDict valueForKey:@"error_description"]);
        return self.users;
    }
    
    [self setDatos:usersDict];
    
    return self.users;
}


/**
 * Get the list of lecturers of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Classroom's identifier
 * @param token the token obtained with the autentication
 * @return Array with all the lecturers of the classroom.
 */
- (NSMutableArray *) getClassroomsIdPeopleTeachers:(NSString *)idenC withToken:(NSString *)token
{
    self.users = [[NSMutableArray alloc] init];
    
    NSURL *usersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/people/teachers?access_token=%@", baseUrl, idenC, token]];
    
    NSData *usersData = [NSData dataWithContentsOfURL:usersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:usersData encoding:NSUTF8StringEncoding]);
    NSDictionary *usersDict = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    
    if ([usersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [usersDict valueForKey:@"error"], [usersDict valueForKey:@"error_description"]);
        return self.users;
    }
    
    [self setDatos:usersDict];
    
    return self.users;
}


/**
 * Get the tutors of the person.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenP Person's identifier
 * @param token the token obtained with the autentication
 * @return Array with person's tutors.
 */
- (NSMutableArray *) getPeopleIdTutors:(NSString *)idenP withToken:(NSString *)token
{
    self.users = [[NSMutableArray alloc] init];
    
    NSURL *usersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people/%@/tutors?access_token=%@", baseUrl, idenP, token]];
    
    NSData *usersData = [NSData dataWithContentsOfURL:usersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:usersData encoding:NSUTF8StringEncoding]);
    NSDictionary *usersDict = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    
    if ([usersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [usersDict valueForKey:@"error"], [usersDict valueForKey:@"error_description"]);
        return self.users;
    }
    
    [self setDatos:usersDict];
    
    return self.users;
}


/**
 * Get the tutors of the user that is using the application.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param token the token obtained with the autentication
 * @return Array with user's tutors.
 */
- (NSMutableArray *) getUserTutors:(NSString *)token
{
    self.users = [[NSMutableArray alloc] init];
    
    NSURL *usersURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/tutors?access_token=%@", baseUrl, token]];
    
    NSData *usersData = [NSData dataWithContentsOfURL:usersURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:usersData encoding:NSUTF8StringEncoding]);
    NSDictionary *usersDict = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    
    if ([usersDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [usersDict valueForKey:@"error"], [usersDict valueForKey:@"error_description"]);
        return self.users;
    }
    
    [self setDatos:usersDict];
    
    return self.users;
}

@end
