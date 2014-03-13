//
//  BoardList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "BoardList.h"


@implementation BoardList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *boards in [dict objectForKey:@"boards"]) {
        Board *b = [[Board alloc] init];
        [b setDatos:boards];
        [self.boards addObject:b];
    }
}

/**
 * Get the list of communication's resources (board, debate, forum) of the classroom.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenC Classroom's identifier
 * @param token the token obtained with the autentication
 * @return ArrayList of Boards with the list of communication's resources of the classroom.
 */
- (NSMutableArray *) getClassroomsIdBoards:(NSString *)idenC withToken:(NSString *)token
{
    self.boards = [[NSMutableArray alloc] init];
    
    NSURL *boardsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards?access_token=%@", baseUrl, idenC, token]];
    
    NSData *boardsData = [NSData dataWithContentsOfURL:boardsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardsData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardsDict = [NSJSONSerialization JSONObjectWithData:boardsData options:0 error:nil];
        
    if ([boardsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardsDict valueForKey:@"error"], [boardsDict valueForKey:@"error_description"]);
        return self.boards;
    }
        
    [self setDatos:boardsDict];
    
    return self.boards;
}


/**
 * Get the list of communication's resources (board, debate, forum) of the subject.
 * The user must have given the application the grant READ to use these operation.
 *
 * @param idenS Subject's identifier
 * @param token the token obtained with the autentication
 * @return ArrayList of Boards with the list of communication's resources of the subject.
 */
- (NSMutableArray *) getSubjectsIdBoards:(NSString *)idenS withToken:(NSString *)token
{
    self.boards = [[NSMutableArray alloc] init];
    
    NSURL *boardsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards?access_token=%@", baseUrl, idenS, token]];
    
    NSData *boardsData = [NSData dataWithContentsOfURL:boardsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardsData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardsDict = [NSJSONSerialization JSONObjectWithData:boardsData options:0 error:nil];
    
    if ([boardsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardsDict valueForKey:@"error"], [boardsDict valueForKey:@"error_description"]);
        return self.boards;
    }
    
    [self setDatos:boardsDict];
    
    return self.boards;
}

@end
